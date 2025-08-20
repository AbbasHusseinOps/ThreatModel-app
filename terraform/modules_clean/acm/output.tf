#output "requested_certificate_arn" {
#  value       = aws_acm_certificate.this.arn
#  description = "ARN of the requested cert, may be Pending validation"
#}

#output "validated_certificate_arn" {
#  value       = (aws_acm_certificate_validation.this.certificate_arn)
#  description = "ARN when the cert is issued"
#}
output "certificate_arn" {
  value       = aws_acm_certificate.this.arn
  description = "ARN of the requested ACM certificate (may still be Pending validation)."
}
