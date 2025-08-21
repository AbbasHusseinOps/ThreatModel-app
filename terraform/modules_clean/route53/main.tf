resource "aws_route53_zone" "this" {
  name          = var.domain_name
  comment       = "Public hosted zone for ${var.domain_name}"
  force_destroy = true
}

resource "aws_route53_record" "apex" {
  count   = var.create_apex_a ? 1 : 0
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "sub_alias" {
  for_each = toset(var.subdomains)

  zone_id = aws_route53_zone.this.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
