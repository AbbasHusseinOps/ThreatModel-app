variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway in the VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets (order should match availability_zones)"
  type        = list(string)
  # DEFAULTS so the root doesn't have to pass them
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "AZ names to place the public subnets in"
  type        = list(string)
  # DEFAULTS so the root doesn't have to pass them
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "name_prefix" {
  description = "Prefix for naming created resources"
  type        = string
  # DEFAULT so the root doesn't have to pass it
  default     = "app"
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_availability_zones" {
  description = "AZs for private subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}
