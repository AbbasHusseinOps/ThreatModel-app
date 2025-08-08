variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "certificate_arn" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

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

variable "health_check_path" {
  description = "Path for the load balancer health check"
  type        = string
  default     = "/" 
}

variable "health_check_port" {
  description = "Port for the load balancer health check"
  type        = string
  default     = "traffic-port" 
}

variable "health_check_interval" {
  description = "Number of seconds between health checks"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Number of seconds before a health check timeout"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Consecutive successful health checks required before marking healthy"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Consecutive failed health checks required before marking unhealthy"
  type        = number
  default     = 2
}

variable "health_check_matcher" {
  description = "HTTP response code to use when checking for a healthy response"
  type        = string
  default     = "200"
}
variable "security_group_id" {
  description = "List of security group IDs to attach to the ALB"
  type        =list(string)
}

