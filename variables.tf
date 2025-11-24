variable "create_bucket" {
  description = "Controls if OBS bucket should be created"
  type        = bool
  default     = true
}

variable "region" {
  description = "Region where the resource(s) will be managed. Defaults to the region set in the provider configuration"
  type        = string
  default     = null
}

variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform can assign a unique name, but for OBS it's recommended to set explicitly"
  type        = string
  default     = null
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Valid: private, public-read, public-read-write, log-delivery-write"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "(Optional, Default:false) Delete all objects so the bucket can be destroyed without error"
  type        = bool
  default     = false
}

variable "storage_class" {
  description = "(Optional) Storage class of the bucket: STANDARD, WARM, COLD"
  type        = string
  default     = null
}

variable "versioning" {
  description = "(Optional) Enable object versioning on the bucket"
  type        = bool
  default     = null
}

variable "multi_az" {
  description = "(Optional, ForceNew) Whether to enable multi-AZ mode for the bucket. Data will be replicated across multiple availability zones for higher availability and durability. Once a bucket is created, you cannot enable or disable multi-AZ mode. Changing this will create a new bucket. Note: Not all regions support single-AZ or multi-AZ storage. Some regions may require multi-AZ by default"
  type        = bool
  default     = null
}

variable "enterprise_project_id" {
  description = "(Optional) The enterprise project ID to which the bucket belongs. Used for enterprise project management and resource organization"
  type        = string
  default     = null
}

variable "quota" {
  description = "(Optional) The bucket quota in bytes. Maximum storage capacity for the bucket. Set to 0 for unlimited storage (default)"
  type        = number
  default     = 0
}

variable "encryption" {
  description = "(Optional) Whether to enable default server-side encryption of the bucket"
  type        = bool
  default     = null
}

variable "sse_algorithm" {
  description = "(Optional) SSE algorithm: kms (KMS-managed) or AES256 (OBS-managed)"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) KMS key ID used when sse_algorithm is kms"
  type        = string
  default     = null
}

variable "kms_key_project_id" {
  description = "(Optional) Project ID to which the KMS key belongs (valid only when kms_key_id is specified)"
  type        = string
  default     = null
}

################################################################################
# Bucket Policy
################################################################################

variable "attach_policy" {
  description = "Controls if bucket policy should be attached to the bucket"
  type        = bool
  default     = false
}

variable "policy" {
  description = "Text of the bucket policy in JSON format"
  type        = string
  default     = null
}

variable "policy_format" {
  description = "Policy format: obs or s3"
  type        = string
  default     = "obs"
}

################################################################################
# Lifecycle Rules
################################################################################

variable "lifecycle_rules" {
  description = "List of lifecycle rules for the bucket"
  type = list(object({
    name    = string
    enabled = bool
    prefix  = optional(string)

    expiration = optional(object({
      days = number
    }))

    transition = optional(list(object({
      days          = number
      storage_class = string
    })))

    noncurrent_version_expiration = optional(object({
      days = number
    }))

    noncurrent_version_transition = optional(list(object({
      days          = number
      storage_class = string
    })))

    abort_incomplete_multipart_upload = optional(object({
      days = number
    }))
  }))
  default = []
}

################################################################################
# CORS Rules
################################################################################

variable "cors_rules" {
  description = "List of CORS rules for the bucket"
  type = list(object({
    allowed_origins = list(string)
    allowed_methods = list(string)
    allowed_headers = optional(list(string))
    expose_headers  = optional(list(string))
    max_age_seconds = optional(number)
  }))
  default = []
}

################################################################################
# Logging
################################################################################

variable "logging" {
  description = "Bucket logging configuration"
  type = object({
    target_bucket = string
    target_prefix = optional(string)
    agency        = string
  })
  default = null
}

################################################################################
# Website Hosting
################################################################################

variable "website" {
  description = "Static website hosting configuration"
  type = object({
    index_document           = optional(string)
    error_document           = optional(string)
    redirect_all_requests_to = optional(string)
    routing_rules            = optional(string)
  })
  default = null
}