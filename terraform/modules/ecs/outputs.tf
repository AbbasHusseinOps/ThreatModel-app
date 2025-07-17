output "execution_role_arn" {
  description = "ARN of the ECS task execution IAM role"
  value       = aws_iam_role.ecs_execution_role.arn
}

output "cluster_id" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.this.id
}

output "cluster_arn" {
  description = "ECS cluster ARN"
  value       = aws_ecs_cluster.this.arn
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.this.arn
}

output "service_id" {
  description = "ECS service ID"
  value       = aws_ecs_service.this.id
}

output "service_arn" {
  description = "ECS service ARN"
  value       = aws_ecs_service.this.arn
}
