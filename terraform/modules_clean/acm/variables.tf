variable "domain_name" {
  description = "The domain name (e.g. abbashussein.com) for which the ACM cert was issued"
  type        = string
  default     = "abbashussein.com"
}

variable "certificate_arn" {
  description = "ARN of an existing ACM certificate for that domain"
  type        = string
  default     = "arn:aws:acm:eu-west-2:885073318616:certificate/d936df6e-ec2e-49b5-b30b-026c0777cc6a"
}
