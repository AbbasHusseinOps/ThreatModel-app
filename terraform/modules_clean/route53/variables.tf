variable "domain_name" {
  type        = string
  description = "Apex domain, for example abbashussein.com"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB, for example my-alb-123.eu-west-2.elb.amazonaws.com"
}

variable "alb_zone_id" {
  type        = string
  description = "Canonical hosted zone ID of the ALB"
}

variable "create_apex_a" {
  type        = bool
  description = "Create an A alias at the apex that points to the ALB"
  default     = false
}

variable "subdomains" {
  type        = list(string)
  description = "Subdomains to point at the ALB, for example [\"www\", \"tmapp\", \"api\"]"
  default     = ["www"]
}
