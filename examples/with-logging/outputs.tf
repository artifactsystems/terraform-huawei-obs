################################################################################
# Log Bucket
################################################################################

output "log_bucket_id" {
  description = "The log bucket ID"
  value       = module.log_bucket.bucket_id
}

output "log_bucket_name" {
  description = "The log bucket name"
  value       = module.log_bucket.bucket_name
}

output "log_bucket_domain_name" {
  description = "The log bucket domain name"
  value       = module.log_bucket.bucket_domain_name
}

################################################################################
# Main Bucket with Logging
################################################################################

output "bucket_id" {
  description = "The bucket ID"
  value       = module.obs_bucket_with_logging.bucket_id
}

output "bucket_name" {
  description = "The bucket name"
  value       = module.obs_bucket_with_logging.bucket_name
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket_with_logging.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = module.obs_bucket_with_logging.bucket_region
}
