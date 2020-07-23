
resource "aws_api_gateway_domain_name" "api_domain" {
  certificate_arn = module.acm_certificate.arn
  domain_name     = "api.gotdadjoke.com"
  security_policy = "TLS_1_2"
}


resource "aws_route53_record" "api_domain_record" {
  zone_id = var.zone_id //no changes needed, see variables.tf file
  name    = "api.gotdadjoke.com"
  type    = "A"
  ttl     = "300" //time to live, default is ok
  records = ["10.0.0.1"]
}

