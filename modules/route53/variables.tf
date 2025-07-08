variable "zone_name" {
  type        = string
  description = "The domain name for the hosted zone "
}

variable "record_name" {
  type        = string
  description = "The name of the record relative to the zone "
  default     = ""
}

variable "alias_target_dns_name" {
  type        = string
  description = "DNS name of the alias target "
}

variable "alias_target_zone_id" {
  type        = string
  description = "Route53 zone ID of the alias target "
}

variable "evaluate_target_health" {
  type        = bool
  description = "Whether Route53 should evaluate the health of the alias target"
  default     = true
}
