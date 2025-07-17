terraform {
  backend "s3" {
    bucket         = "abbas-ecs-tfstate-885073318616-eu-west-2"
    key            = "threatmodel-esc/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
