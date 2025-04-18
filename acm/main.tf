data "aws_route53_zone" "this" {
  zone_id = var.pub_zone_id
}

resource "aws_acm_certificate" "acm_certificate" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  validation_option {
    domain_name       = var.domain_name
    validation_domain = data.aws_route53_zone.this.name
  }
  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }
}

resource "aws_route53_record" "acm_record" {
  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = data.aws_route53_zone.this.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "acm_certificate_validation" {
  certificate_arn         = aws_acm_certificate.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_record : record.fqdn]
}
