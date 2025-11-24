################################################################################
# OBS Bucket
################################################################################

output "bucket_id" {
  description = "The name of the bucket"
  value       = module.obs_bucket.bucket_id
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = module.obs_bucket.bucket_name
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.obs_bucket.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = module.obs_bucket.bucket_region
}

output "bucket_version" {
  description = "The OBS version of the bucket"
  value       = module.obs_bucket.bucket_version
}

output "bucket_versioning_enabled" {
  description = "Whether versioning is enabled"
  value       = module.obs_bucket.bucket_versioning_enabled
}

output "bucket_storage_class" {
  description = "The storage class of the bucket"
  value       = module.obs_bucket.bucket_storage_class
}

output "bucket_storage_info" {
  description = "The storage info of the bucket (size and object_number)"
  value       = module.obs_bucket.bucket_storage_info
}
