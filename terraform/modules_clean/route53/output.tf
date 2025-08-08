output "domain_name" {
  description = "The hosted zone’s domain name"
  value       = var.domain_name
}

output "zone_id" {
  description = "The ID of the existing hosted zone"
  value       = data.aws_route53_zone.this.zone_id
}

output "name_servers" {
  description = "The name servers for DNS delegation"
  value       = data.aws_route53_zone.this.name_servers
}
