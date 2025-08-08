variable "http_port" {
type = string
default = "80"
}

variable "https_port" {
  type = string
  default = "443"
}
variable "app_port" {
  type = string
  default = "3000"
}

variable "allowed_cidr_blocks" {
  type = list(string)
  
}


variable "name_prefix" {
  description = "name"
  type = string
  default = "Abbas-ECS-ThreatModel"
  }

variable "vpc_id" {
  description = "id of vpc"
  type = string
}