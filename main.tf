locals {
  create_bucket = var.create_bucket
  attach_policy = var.attach_policy && var.policy != null
}

################################################################################
# OBS Bucket
################################################################################

resource "huaweicloud_obs_bucket" "this" {
  count = local.create_bucket ? 1 : 0

  bucket                = var.bucket
  region                = var.region
  acl                   = var.acl
  storage_class         = var.storage_class
  force_destroy         = var.force_destroy
  versioning            = var.versioning
  multi_az              = var.multi_az
  enterprise_project_id = var.enterprise_project_id
  quota                 = var.quota

  # Server-side encryption
  encryption         = var.encryption
  sse_algorithm      = var.sse_algorithm
  kms_key_id         = var.kms_key_id
  kms_key_project_id = var.kms_key_project_id

  # Lifecycle rules
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules

    content {
      name    = lifecycle_rule.value.name
      enabled = lifecycle_rule.value.enabled
      prefix  = lifecycle_rule.value.prefix

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration != null ? [lifecycle_rule.value.expiration] : []

        content {
          days = expiration.value.days
        }
      }

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition != null ? lifecycle_rule.value.transition : []

        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration != null ? [lifecycle_rule.value.noncurrent_version_expiration] : []

        content {
          days = noncurrent_version_expiration.value.days
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transition != null ? lifecycle_rule.value.noncurrent_version_transition : []

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      dynamic "abort_incomplete_multipart_upload" {
        for_each = lifecycle_rule.value.abort_incomplete_multipart_upload != null ? [lifecycle_rule.value.abort_incomplete_multipart_upload] : []

        content {
          days = abort_incomplete_multipart_upload.value.days
        }
      }
    }
  }

  # CORS rules
  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      allowed_origins = cors_rule.value.allowed_origins
      allowed_methods = cors_rule.value.allowed_methods
      allowed_headers = cors_rule.value.allowed_headers
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  # Logging
  dynamic "logging" {
    for_each = var.logging != null ? [var.logging] : []

    content {
      target_bucket = logging.value.target_bucket
      target_prefix = logging.value.target_prefix
      agency        = logging.value.agency
    }
  }

  # Website hosting
  dynamic "website" {
    for_each = var.website != null ? [var.website] : []

    content {
      index_document           = website.value.index_document
      error_document           = website.value.error_document
      redirect_all_requests_to = website.value.redirect_all_requests_to
      routing_rules            = website.value.routing_rules
    }
  }

  tags = var.tags
}

################################################################################
# Bucket Policy
################################################################################

resource "huaweicloud_obs_bucket_policy" "this" {
  count = local.create_bucket && local.attach_policy ? 1 : 0

  bucket        = huaweicloud_obs_bucket.this[0].id
  policy        = var.policy
  policy_format = var.policy_format
}
