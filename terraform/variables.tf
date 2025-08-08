variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "backend_bucket" {
  type    = string
  default = "abbas-ecs-tfstate-885073318616-eu-west-2"
}

variable "backend_key" {
  type    = string
  default = "threatmodel-esc/terraform.tfstate"
}

variable "backend_region" {
  type    = string
  default = "eu-west-2"
}

variable "backend_dynamodb_table" {
  type    = string
  default = "terraform-state-locks"
}

variable "backend_encrypt" {
  type    = bool
  default = true
}

variable "name_prefix" {
  type    = string
  default = "abbas-tm-app"
}

variable "website_url" {
  type    = string
  default = "https://tmapp.abbashussein.com"
}

variable "alb_certificate_arn" {
  type    = string
  default = ""
}

variable "alb_allowed_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sgs_allowed_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "ecs_image_url" {
  type    = string
  default = ""
}
variable "website_domain" {
  type    = string
  default = "tmapp.abbashussein.com"
}

variable "route53_zone_id" {
  type    = string
  default = "Z05102641J2FHMEIIXHR2"
}
