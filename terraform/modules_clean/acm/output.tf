output "domain_name" {
  description = "The domain name for the certificate"
  value       = var.domain_name
}

output "certificate_arn" {
  description = "The ARN of the existing ACM certificate"
  value       = var.certificate_arn
}

output "certificate_id" {
  description = "The certificate’s ID (suffix of the ARN)"
  value       = split("/", var.certificate_arn)[1]
}
