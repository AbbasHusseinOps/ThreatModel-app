variable "domain_name" {
  description = "The name of the hosted zone (e.g. example.com)"
  type        = string
  default     = "*abbashussein.com"
}
variable "zone_id" {
  description = "ID of the existing hosted zone (to unambiguously select it)"
  type        = string
  default     = "Z05102641J2FHMEIIXHR2"
}

