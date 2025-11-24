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
    GithubRepo = "terraform-huaweicloud-obs"
    GithubOrg  = "terraform-huaweicloud-modules"
  }
}

################################################################################
# OBS Bucket for Static Website Hosting
################################################################################

module "obs_website_bucket" {
  source = "../../"

  bucket        = "${local.name}-site"
  acl           = "public-read"
  force_destroy = true

  # Bucket policy for public read access to objects
  attach_policy = true
  policy = jsonencode({
    Statement = [{
      Sid    = "PublicReadGetObject"
      Effect = "Allow"
      Principal = {
        ID = "*"
      }
      Action   = ["GetObject"]
      Resource = "${local.name}-site/*"
    }]
  })

  # Website configuration
  website = {
    index_document = "index.html"
    error_document = "error.html"
    routing_rules = jsonencode([
      {
        Condition = {
          KeyPrefixEquals = "docs/"
        }
        Redirect = {
          ReplaceKeyPrefixWith = "documents/"
        }
      }
    ])
  }

  # CORS for website access
  cors_rules = [
    {
      allowed_origins = ["*"]
      allowed_methods = ["GET", "HEAD"]
      max_age_seconds = 3600
    }
  ]

  tags = local.tags
}