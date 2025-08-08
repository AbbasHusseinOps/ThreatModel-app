data "aws_route53_zone" "this" {
  name         = "${var.domain_name}."
  zone_id = var.zone_id
}
