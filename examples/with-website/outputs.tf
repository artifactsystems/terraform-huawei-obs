################################################################################
# Website Bucket
################################################################################

output "bucket_id" {
  description = "The bucket ID"
  value       = module.obs_website_bucket.bucket_id
}

output "bucket_name" {
  description = "The bucket name"
  value       = module.obs_website_bucket.bucket_name
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_website_bucket.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = module.obs_website_bucket.bucket_region
}

output "website_endpoint" {
  description = "Website endpoint URL"
  value       = "http://${module.obs_website_bucket.bucket_domain_name}"
}