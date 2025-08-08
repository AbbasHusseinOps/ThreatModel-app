output "execution_role_name" {
  value = aws_iam_role.execution.name
}

output "execution_role_arn" {
  value = aws_iam_role.execution.arn
}

output "deployer_username" {
  value = aws_iam_user.deployer.name
}

output "deployer_policy_arn" {
  value = aws_iam_policy.deployer_policy.arn
}

output "deployer_access_key_id" {
  value     = aws_iam_access_key.deployer_key.id
  sensitive = true
}

output "deployer_secret_access_key" {
  value     = aws_iam_access_key.deployer_key.secret
  sensitive = true
}
