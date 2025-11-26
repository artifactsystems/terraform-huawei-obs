output "bucket_id" {
  description = "The name of the bucket"
  value       = module.obs_bucket.bucket_id
}

output "bucket_domain_name" {
  description = "The domain name of the bucket"
  value       = module.obs_bucket.bucket_domain_name
}

output "bucket_region" {
  description = "The region of the bucket"
  value       = module.obs_bucket.bucket_region
}

output "bucket_storage_class" {
  description = "The storage class of the bucket"
  value       = module.obs_bucket.bucket_storage_class
}

output "bucket_multi_az" {
  description = "Whether multi-AZ is enabled for the bucket"
  value       = module.obs_bucket.bucket_multi_az
}
