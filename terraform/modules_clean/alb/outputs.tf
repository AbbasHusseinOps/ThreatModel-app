output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_zone_id" {
  value = aws_lb.this.zone_id
}

#output "https_listener_arn" {
# value = aws_lb_listener.https.arn
#}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}
output "https_listener_arn" {
  value       = (aws_lb_listener.https.arn)
  description = "HTTPS listener ARN if created"
}
