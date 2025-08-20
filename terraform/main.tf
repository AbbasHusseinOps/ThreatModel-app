 data "aws_ecr_repository" "app" {
   name = "abbas-app-repo"
 }

module "vpc" {
  source = "./modules_clean/vpc"
}

module "networking" {
  source              = "./modules_clean/networking"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.networking.internet_gateway_id

}

module "sgs" {
  source              = "./modules_clean/sgs"
  name_prefix         = var.name_prefix
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = var.sgs_allowed_cidr_blocks
}

module "alb" {
  source               = "./modules_clean/alb"
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.networking.subnet_ids
  certificate_arn      = module.acm.certificate_arn
  name_prefix          = var.name_prefix
  allowed_cidr_blocks  = var.alb_allowed_cidr_blocks
  security_group_id   = [ module.sgs.this_sg_id ]
 
}

module "ecs" {
  source               = "./modules_clean/ecs"
  name_prefix          = var.name_prefix
  image_url            = "${data.aws_ecr_repository.app.repository_url}:latest"
  subnet_ids           = module.networking.private_subnet_ids
  security_group_ids   = [ module.sgs.this_sg_id ]
  target_group_arn     = module.alb.target_group_arn
  listener_arn         = module.alb.https_listener_arn
  execution_role_arn   = module.iam.execution_role_arn
}

module "s3" {
  source = "./modules_clean/s3"
}

module "route53" {
  source                = "./modules_clean/route53"
   domain_name   = var.domain_name
  alb_dns_name  = module.alb.alb_dns_name
  alb_zone_id   = module.alb.alb_zone_id

  create_apex_a = false
  subdomains    = ["tmapp", "www"]
}

module "iam" {
  source = "./modules_clean/iam"
}

module "acm" {
  source      = "./modules_clean/acm"
  domain_name               = "abbashussein.com"
  subject_alternative_names = ["*.abbashussein.com"]
  zone_id                   = module.route53.zone_id
}




