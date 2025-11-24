################################################################################
# OBS Bucket with Policy (OBS Format)
################################################################################

output "obs_format_bucket_id" {
  description = "The bucket ID"
  value       = module.obs_bucket_with_policy.bucket_id
}

output "obs_format_bucket_name" {
  description = "The bucket name"
  value       = module.obs_bucket_with_policy.bucket_name
}

output "obs_format_bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket_with_policy.bucket_domain_name
}

output "obs_format_bucket_policy_id" {
  description = "The bucket policy ID"
  value       = module.obs_bucket_with_policy.bucket_policy_id
}

################################################################################
# OBS Bucket with Policy (S3 Format)
################################################################################

output "s3_format_bucket_id" {
  description = "The bucket ID"
  value       = module.obs_bucket_with_s3_policy.bucket_id
}

output "s3_format_bucket_name" {
  description = "The bucket name"
  value       = module.obs_bucket_with_s3_policy.bucket_name
}

output "s3_format_bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket_with_s3_policy.bucket_domain_name
}

output "s3_format_bucket_policy_id" {
  description = "The bucket policy ID"
  value       = module.obs_bucket_with_s3_policy.bucket_policy_id
}