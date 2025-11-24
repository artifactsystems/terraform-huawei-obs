################################################################################
# OBS Bucket with Lifecycle
################################################################################

output "bucket_id" {
  description = "The bucket ID"
  value       = module.obs_bucket_with_lifecycle.bucket_id
}

output "bucket_name" {
  description = "The bucket name"
  value       = module.obs_bucket_with_lifecycle.bucket_name
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket_with_lifecycle.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = module.obs_bucket_with_lifecycle.bucket_region
}