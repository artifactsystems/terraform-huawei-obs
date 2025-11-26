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
# OBS Bucket with Policy (OBS Format)
################################################################################

module "obs_bucket_with_policy" {
  source = "../../"

  bucket        = "${local.name}-obs-format"
  acl           = "private"
  versioning    = true
  force_destroy = true

  # Bucket policy (OBS format)
  attach_policy = true
  policy_format = "obs"
  policy = jsonencode({
    Statement = [
      {
        Sid    = "PublicReadGetObject"
        Effect = "Allow"
        Principal = {
          ID = "*"
        }
        Action   = ["GetObject"]
        Resource = "${local.name}-obs-format/*"
      }
    ]
  })

  tags = local.tags
}

################################################################################
# OBS Bucket with Policy (S3 Format)
################################################################################

module "obs_bucket_with_s3_policy" {
  source = "../../"

  bucket        = "${local.name}-s3-format"
  acl           = "private"
  versioning    = true
  force_destroy = true

  # Bucket policy (S3 format - for S3 API compatibility)
  attach_policy = true
  policy_format = "s3"
  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${local.name}-s3-format/*"
      }
    ]
  })

  tags = local.tags
}
