output "requested_certificate_arn" {
  value       = aws_acm_certificate.this.arn
  description = "ARN of the requested cert (may be pending)."
}
output "issued_certificate_arn" {
  value       = try(aws_acm_certificate_validation.this[0].certificate_arn, null)
  description = "ARN of the issued cert (exists only when validation completes)."
}
