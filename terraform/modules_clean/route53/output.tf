output "zone_id"   { value = aws_route53_zone.this.zone_id }
output "zone_name" { value = aws_route53_zone.this.name }

output "record_fqdns" {
  value = concat(
    var.create_apex_a ? [aws_route53_record.apex[0].fqdn] : [],
    [for r in aws_route53_record.sub_alias : r.fqdn]
  )
}
output "name_servers" {
  value       = aws_route53_zone.this.name_servers
  description = "Authoritative NS for the hosted zone"
}
