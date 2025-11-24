variable "enterprise_project_id" {
  description = "Enterprise project ID for the bucket (optional, only required if using enterprise project management)"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ID for encryption (optional, only required for multi-az bucket example)"
  type        = string
  default     = null
}

