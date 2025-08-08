variable "name_prefix" {
  description = "Global prefix for all ECS resources"
  type        = string
  default = "Abbas-tmapp"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default = "Abbas-tmapp"
}

variable "cluster_insight_name" {
  description = "CloudWatch Container Insights setting name"
  type        = string
  default = "containerInsights"
}

variable "cluster_insight_value" {
  description = "CloudWatch Container Insights setting value"
  type        = string
  default = "enabled"
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default = "Abbas-tmapp"
}

variable "task_cpu" {
  description = "CPU units to allocate to the ECS task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory (MB) to allocate to the ECS task"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "ARN of the IAM role for ECS task execution"
  type        = string
}

variable "container_name" {
  description = "Name of the container inside the task"
  type        = string
  default = "tmapp"
}

variable "image_url" {
  description = "Full URI of the container image (including tag)"
  type        = string
  default = ""
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
  default     = 3000
}

variable "service_name" {
  description = "Logical name for the ECS service"
  type        = string
  default = "abbas-tmapp"
}

variable "desired_count" {
  description = "Number of tasks to run in the ECS service"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for Fargate tasks"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the service"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the ALB target group for the service"
  type        = string
}

variable "listener_arn" {
  description = "ARN of the ALB listener to use for the service"
  type        = string
}
