provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.vpc_cidr_block
  name_prefix = var.name_prefix
}

module "networking" {
  source              = "./modules/networking"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["eu-west-2a", "eu-west-2b"]
  name_prefix         = var.name_prefix
}


module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.networking.subnet_ids
  certificate_arn     = var.acm_certificate_arn
  name_prefix         = var.name_prefix
  allowed_cidr_blocks = var.allowed_cidr_blocks
}
module "ecs" {
   source             = "./modules/ecs"
   name_prefix        = var.name_prefix
   subnet_ids         = module.networking.subnet_ids
   security_group_id  = module.alb.security_group_id
   target_group_arn   = module.alb.target_group_arn
   listener_arn       = module.alb.https_listener_arn
   container_image    = "885073318616.dkr.ecr.eu-west-2.amazonaws.com/abbas-app-repo:latest"
   container_port     = 3000
 }

module "s3" {
  source        = "./modules/s3"
  
}

module "route53" {
  source                = "./modules/route53"
  zone_name             = var.route53_zone_name        
  record_name           = ""                           
  alias_target_dns_name = module.alb.alb_dns_name
  alias_target_zone_id  = module.alb.alb_zone_id
}






