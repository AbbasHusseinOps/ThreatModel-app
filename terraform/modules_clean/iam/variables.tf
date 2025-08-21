variable "tags" {
  description = "Tags to apply to all IAM resources"
  type        = map(string)
  default     = {}
}

variable "execution_role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
  default     = "ecs-exec-role"
}

variable "execution_assume_service" {
  description = "Service principal for ECS task execution role"
  type        = string
  default     = "ecs-tasks.amazonaws.com"
}

variable "execution_inline_policy_name" {
  description = "Name of the inline policy attached to the ECS execution role"
  type        = string
  default     = "ecs-exec-inline-policy"
}

variable "execution_log_actions" {
  description = "CloudWatch Logs actions allowed for ECS tasks"
  type        = list(string)
  default     = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
  ]
}

variable "execution_log_resources" {
  description = "ARNs for CloudWatch Logs"
  type        = list(string)
  default     = ["*"]
}

variable "execution_ecr_actions" {
  description = "ECR actions allowed for ECS tasks"
  type        = list(string)
  default     = [
    "ecr:GetAuthorizationToken",
    "ecr:BatchGetImage",
    "ecr:GetDownloadUrlForLayer"
  ]
}

variable "execution_ecr_resources" {
  description = "ARNs for ECR repositories"
  type        = list(string)
  default     = ["*"]
}

variable "deployer_username" {
  description = "IAM user for Terraform deployments"
  type        = string
  default     = "tm-ecs-deployer"
}

variable "deployer_policy_name" {
  description = "Name of the custom IAM policy for the deployer user"
  type        = string
  default     = "Abbas-tm-ESC-Deploy"
}

variable "deployer_policy_document" {
  description = "Least-privilege JSON policy for the deployer user"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "TerraformStateS3",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:ListBucketVersions"
      ],
      "Resource": [
        "arn:aws:s3:::abbas-ecs-tfstate-885073318616-eu-west-2",
        "arn:aws:s3:::abbas-ecs-tfstate-885073318616-eu-west-2/*"
      ]
    },
    {
      "Sid": "TerraformStateDynamoDB",
      "Effect": "Allow",
      "Action": [
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:eu-west-2:885073318616:table/terraform-state-locks"
    },
    {
      "Sid": "EC2Networking",
      "Effect": "Allow",
      "Action": [
        "ec2:CreateVpc",
        "ec2:DescribeVpcs",
        "ec2:DeleteVpc",
        "ec2:ModifyVpcAttribute",
        "ec2:CreateSubnet",
        "ec2:DescribeSubnets",
        "ec2:DeleteSubnet",
        "ec2:ModifySubnetAttribute",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:CreateInternetGateway",
        "ec2:AttachInternetGateway",
        "ec2:DetachInternetGateway",
        "ec2:DescribeInternetGateways",
        "ec2:DeleteInternetGateway",
        "ec2:CreateNatGateway",
        "ec2:DescribeNatGateways",
        "ec2:DeleteNatGateway",
        "ec2:AllocateAddress",
        "ec2:DescribeAddresses",
        "ec2:AssociateAddress",
        "ec2:DisassociateAddress",
        "ec2:ReleaseAddress",
        "ec2:CreateRouteTable",
        "ec2:AssociateRouteTable",
        "ec2:CreateRoute",
        "ec2:DeleteRouteTable",
        "ec2:DisassociateRouteTable",
        "ec2:DeleteRoute",
        "ec2:DescribeRouteTables",
        "ec2:CreateSecurityGroup",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupEgress",
        "ec2:DescribeSecurityGroups",
        "ec2:DeleteSecurityGroup",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ElasticLoadBalancing",
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:CreateLoadBalancer",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DeleteLoadBalancer",
        "elasticloadbalancing:CreateTargetGroup",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:DeleteTargetGroup",
        "elasticloadbalancing:RegisterTargets",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:DescribeTargetHealth",
        "elasticloadbalancing:DescribeTags",
        "elasticloadbalancing:CreateListener",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DeleteListener",
        "elasticloadbalancing:ModifyListener"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ECSManagement",
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DescribeClusters",
        "ecs:DeleteCluster",
        "ecs:RegisterTaskDefinition",
        "ecs:DescribeTaskDefinition",
        "ecs:ListTaskDefinitions",
        "ecs:CreateService",
        "ecs:UpdateService",
        "ecs:DescribeServices",
        "ecs:ListServices",
        "ecs:DeleteService"
      ],
      "Resource": "*"
    },
    {
      "Sid": "CloudWatchLogs",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ECRReadOnly",
      "Effect": "Allow",
      "Action": [
        "ecr:DescribeRepositories",
        "ecr:DescribeImages",
        "ecr:ListImages",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "arn:aws:ecr:eu-west-2:885073318616:repository/Abbas-ECS-ThreatModel"
    },
    {
      "Sid": "S3AppBucket",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::abbas-app-bucket",
        "arn:aws:s3:::abbas-app-bucket/*"
      ]
    },
    {
      "Sid": "Route53Permissions",
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:ListHostedZones",
        "route53:ListHostedZonesByName",
        "route53:GetHostedZone",
        "route53:ListResourceRecordSets",
        "route53:GetChange",
        "route53:ListTagsForResource",
        "route53:UpdateHostedZoneComment",
        "route53:GetDNSSEC"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ACMFull",
      "Effect": "Allow",
      "Action": [
        "acm:ListCertificates",
        "acm:DescribeCertificate",
        "acm:GetCertificate",
        "acm:ListTagsForCertificate",
        "acm:RequestCertificate",
        "acm:DeleteCertificate"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Route53HostedZoneLifecycle",
      "Effect": "Allow",
      "Action": [
        "route53:CreateHostedZone",
        "route53:DeleteHostedZone"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
