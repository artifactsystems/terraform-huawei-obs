provider "huaweicloud" {
  region = local.region
}

################################################################################
# Local Variables
################################################################################

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "tr-west-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-huawei-obs"
    GithubOrg  = "artifactsystems"
  }
}

################################################################################
# OBS Bucket with Lifecycle Rules
################################################################################

module "obs_bucket_with_lifecycle" {
  source = "../../"

  bucket        = "${local.name}-bucket"
  acl           = "private"
  versioning    = true
  force_destroy = true

  lifecycle_rules = [
    # Rule 1: Log files - expire and transition to cheaper storage
    {
      name    = "log-lifecycle"
      enabled = true
      prefix  = "logs/"

      expiration = {
        days = 365
      }

      transition = [
        {
          days          = 60
          storage_class = "WARM"
        },
        {
          days          = 180
          storage_class = "COLD"
        }
      ]

      abort_incomplete_multipart_upload = {
        days = 7
      }
    },

    # Rule 2: Temporary files - quick expiration
    {
      name    = "tmp-cleanup"
      enabled = true
      prefix  = "tmp/"

      expiration = {
        days = 30
      }
    },

    # Rule 3: Old versions cleanup (requires versioning)
    {
      name    = "version-cleanup"
      enabled = true

      noncurrent_version_expiration = {
        days = 90
      }

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "WARM"
        },
        {
          days          = 60
          storage_class = "COLD"
        }
      ]
    }
  ]

  tags = local.tags
}