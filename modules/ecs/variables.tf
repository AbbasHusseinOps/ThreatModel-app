variable "name_prefix" {
  type        = string
  description = "Common prefix for all ECS resources"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the ECS service"
}

variable "security_group_id" {
  type        = string
  description = "SG's ID to attach to the ECS"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the ALB target group"
}

variable "listener_arn" {
  type        = string
  description = "ARN of the ALB listener "
}

variable "container_image" {
  type        = string
  description = "Docker image"
}

variable "container_port" {
  type        = number
  description = "Port the container listens on"
}
