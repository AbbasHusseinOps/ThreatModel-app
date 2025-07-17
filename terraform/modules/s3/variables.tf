variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default = "abbas-tmapp"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to forcibly destroy all objects when deleting the bucket"
  default     = false
}

variable "block_public_acls" {
  type        = bool
 default     = true
}

variable "ignore_public_acls" {
  type        = bool
  default     = true
}

variable "block_public_policy" {
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  default     = true
}
