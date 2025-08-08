resource "aws_iam_role" "execution" {
  name               = var.execution_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "ECSTasksAssumeRole"
      Effect    = "Allow"
      Action    = "sts:AssumeRole"
      Principal = { Service = var.execution_assume_service }
    }]
  })
  tags = var.tags
}

resource "aws_iam_role_policy" "execution_inline" {
  name   = var.execution_inline_policy_name
  role   = aws_iam_role.execution.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowLogs"
        Effect   = "Allow"
        Action   = var.execution_log_actions
        Resource = var.execution_log_resources
      },
      {
        Sid      = "AllowECR"
        Effect   = "Allow"
        Action   = var.execution_ecr_actions
        Resource = var.execution_ecr_resources
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "execution_managed" {
  role       = aws_iam_role.execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_user" "deployer" {
  name = var.deployer_username
  tags = var.tags
}

resource "aws_iam_policy" "deployer_policy" {
  name   = var.deployer_policy_name
  policy = var.deployer_policy_document
}

resource "aws_iam_user_policy_attachment" "deployer_attach" {
  user       = aws_iam_user.deployer.name
  policy_arn = aws_iam_policy.deployer_policy.arn
}

resource "aws_iam_access_key" "deployer_key" {
  user = aws_iam_user.deployer.name
}
