variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "name_prefix" {
  type    = string
  default = "abbas"
}

variable "acm_certificate_arn" {
  type = string
  default = "arn:aws:acm:eu-west-2:885073318616:certificate/32bff016-bf41-4c0f-b5d4-68d10dba4d34"
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "availability_zones" {
  type = list(string)
}
variable "route53_zone_name" {
  type        = string
  description = "The name of the Route53 hosted zonee"
}
variable "s3_bucket_name" {
  type        = string
  description = "Name for the application S3 bucket"
  default     = "abbas-tmapp"
}


