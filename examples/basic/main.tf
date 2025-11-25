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
# OBS Bucket Module
################################################################################

module "obs_bucket" {
  source = "../../"

  bucket        = "${local.name}-bucket"
  acl           = "private"
  storage_class = "STANDARD"
  versioning    = true
  force_destroy = true

  # Single-AZ by default (set to true for multi-AZ in production environments)
  # Note: Some regions may require multi-AZ and ignore this setting
  multi_az = false

  # Server-side encryption with AES256
  encryption    = true
  sse_algorithm = "AES256"

  tags = local.tags
}
