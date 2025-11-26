################################################################################
# OBS Bucket with CORS
################################################################################

output "bucket_id" {
  description = "The bucket ID"
  value       = module.obs_bucket_with_cors.bucket_id
}

output "bucket_name" {
  description = "The bucket name"
  value       = module.obs_bucket_with_cors.bucket_name
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket_with_cors.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = module.obs_bucket_with_cors.bucket_region
}
