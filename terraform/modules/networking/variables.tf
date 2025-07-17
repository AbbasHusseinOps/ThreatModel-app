variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "internet_gateway_id" {
  type = string
}

variable "name_prefix" {
  type = string
}
