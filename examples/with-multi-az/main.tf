provider "huaweicloud" {
  region = local.region
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
# Multi-AZ Bucket with Enterprise Project
################################################################################
# Multi-AZ provides higher availability and durability by replicating data
# across multiple availability zones in the same region.
#
# NOTE:
# - Multi-AZ can only be set during bucket creation and cannot be changed later
# - Not all regions support single-AZ or multi-AZ storage
# - Some regions (like TR-Istanbul) may require multi-AZ by default
# - Multi-AZ is only supported for STANDARD and Infrequent Access storage classes
# - Check regional availability: https://support.huaweicloud.com/intl/en-us/price-obs/obs_42_0003.html

module "obs_bucket" {
  source = "../../"

  bucket                = local.name
  acl                   = "private"
  storage_class         = "STANDARD"
  versioning            = true
  force_destroy         = true
  multi_az              = true # Set to false for single-AZ (lower cost) or true for multi-AZ (higher availability)
  enterprise_project_id = var.enterprise_project_id

  # Enable encryption for production use
  encryption    = true
  sse_algorithm = "kms"
  kms_key_id    = var.kms_key_id

  tags = local.tags
}
