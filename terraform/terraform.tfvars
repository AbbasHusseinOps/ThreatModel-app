aws_region              = "eu-west-2"
backend_bucket          = "abbas-ecs-tfstate-885073318616-eu-west-2"
backend_key             = "threatmodel-esc/terraform.tfstate"
backend_region          = "eu-west-2"
backend_dynamodb_table  = "terraform-state-locks"
backend_encrypt         = true
name_prefix             = "abbas-tm-app"
alb_allowed_cidr_blocks = ["0.0.0.0/0"]
sgs_allowed_cidr_blocks = ["10.0.0.0/16"]
ecs_image_url           ="885073318616.dkr.ecr.eu-west-2.amazonaws.com/Abbas-ECS-ThreatModel:latest"
domain_name     = "abbashussein.com"
app_subdomains  = ["tmapp", "www"]




