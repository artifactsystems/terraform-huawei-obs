output "bucket_id" {
  description = "The name of the bucket"
  value       = try(huaweicloud_obs_bucket.this[0].id, null)
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = try(huaweicloud_obs_bucket.this[0].bucket, null)
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = try(huaweicloud_obs_bucket.this[0].bucket_domain_name, null)
}

output "bucket_region" {
  description = "The region where the bucket resides"
  value       = try(huaweicloud_obs_bucket.this[0].region, null)
}

output "bucket_version" {
  description = "The OBS version of the bucket"
  value       = try(huaweicloud_obs_bucket.this[0].bucket_version, null)
}

output "bucket_versioning_enabled" {
  description = "Whether versioning is enabled"
  value       = try(huaweicloud_obs_bucket.this[0].versioning, null)
}

output "bucket_storage_class" {
  description = "The storage class of the bucket"
  value       = try(huaweicloud_obs_bucket.this[0].storage_class, null)
}

output "bucket_storage_info" {
  description = "The storage info of the bucket (size and object_number)"
  value       = try(huaweicloud_obs_bucket.this[0].storage_info, null)
}

output "bucket_multi_az" {
  description = "Whether multi-AZ is enabled for the bucket"
  value       = try(huaweicloud_obs_bucket.this[0].multi_az, null)
}

################################################################################
# Bucket Policy
################################################################################

output "bucket_policy_id" {
  description = "The bucket policy ID"
  value       = try(huaweicloud_obs_bucket_policy.this[0].id, null)
}
