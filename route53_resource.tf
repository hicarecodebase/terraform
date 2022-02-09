resource "aws_route53_zone" "domain_route" {
  name    = var.domain_name
  comment = "Som The Dev Domain"
  tags = {
    "Name"        = "Som Domain"
    "Environment" = "Production"
  }
}

resource "aws_route53_record" "domain-a-record" {
  zone_id = aws_route53_zone.domain_route.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.s3_bucket.website_domain
    zone_id                = aws_s3_bucket.s3_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "domain-cname-record" {
  zone_id = aws_route53_zone.domain_route.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain_name}"]
}
