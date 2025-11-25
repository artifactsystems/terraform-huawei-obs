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
# Log Bucket (receives logs)
################################################################################

module "log_bucket" {
  source = "../../"

  bucket        = "${local.name}-logs"
  acl           = "log-delivery-write"
  force_destroy = true

  tags = merge(local.tags, {
    Purpose = "log-storage"
  })
}

################################################################################
# Main Bucket with Logging Enabled
################################################################################

module "obs_bucket_with_logging" {
  source = "../../"

  bucket        = "${local.name}-bucket"
  acl           = "private"
  versioning    = true
  force_destroy = true

  # Logging configuration
  logging = {
    target_bucket = module.log_bucket.bucket_id
    target_prefix = "access-logs/"
    agency        = var.agency_name
  }

  tags = local.tags
}