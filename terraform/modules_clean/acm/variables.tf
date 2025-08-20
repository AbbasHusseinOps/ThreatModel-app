variable "domain_name" {
  type        = string
  description = "Primary domain"
}

variable "subject_alternative_names" {
  type        = list(string)
  default     = []
}

variable "zone_id" {
  type        = string
  description = "Hosted zone ID for DNS validation records"
}

# New: hard gate so for_each is not evaluated until we flip it on
variable "enable_validation" {
  type        = bool
  default     = false
  description = "Create Route53 validation records and wait for ISSUED when true"
}
