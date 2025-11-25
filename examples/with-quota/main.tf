provider "huaweicloud" {
  region = "tr-west-1"
}

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
# Bucket with Storage Quota
################################################################################
# Storage quota limits the maximum storage capacity of a bucket in bytes.
# Useful for:
# - Cost control and budget management
# - Multi-tenant applications (limit per tenant)
# - Development/test environments (prevent runaway growth)
#
# Common quota values:
# - 1 GB  = 1073741824 bytes
# - 5 GB  = 5368709120 bytes
# - 10 GB = 10737418240 bytes
# - 50 GB = 53687091200 bytes
#
# Note: Set quota to 0 for unlimited storage (default)

module "obs_bucket" {
  source = "../../"

  bucket        = local.name
  acl           = "private"
  storage_class = "STANDARD"
  force_destroy = true
  quota         = 104857600 # 100 MB limit (for easy testing)

  tags = local.tags
}