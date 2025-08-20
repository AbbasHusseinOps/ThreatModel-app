output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.networking.subnet_ids
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_zone_id" {
  value = module.alb.alb_zone_id
}

output "website_url" {
  value = "https://tmapp.abbashussein.com"
}
output "name_servers" {
  description = "Authoritative NS for the hosted zone"
  value       = module.route53.name_servers
}
