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
# OBS Bucket with CORS Rules
################################################################################

module "obs_bucket_with_cors" {
  source = "../../"

  bucket        = "${local.name}-bucket"
  acl           = "public-read"
  force_destroy = true

  cors_rules = [
    # Rule 1: Allow specific origin with all common methods
    {
      allowed_origins = ["https://example.com", "https://www.example.com"]
      allowed_methods = ["GET", "PUT", "POST", "DELETE", "HEAD"]
      allowed_headers = ["*"]
      expose_headers  = ["ETag", "Content-Length", "Content-Type"]
      max_age_seconds = 3600
    },
    # Rule 2: Allow any origin for read-only access
    {
      allowed_origins = ["*"]
      allowed_methods = ["GET", "HEAD"]
      max_age_seconds = 1800
    }
  ]

  tags = local.tags
}
