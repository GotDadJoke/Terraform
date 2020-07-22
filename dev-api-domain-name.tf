//create custom domain name in APIGateway to make calls from frontend and connect lambda function
resource "aws_api_gateway_domain_name" "dev_api_domain" {
  certificate_arn = module.acm_certificate.arn
  domain_name     = "dev-api.gotdadjoke.com"
  security_policy = "TLS_1_2"
}

//create/update Route53 record
resource "aws_route53_record" "dev_api_domain_record" {
  name    = aws_api_gateway_domain_name.dev_api_domain.domain_name
  type    = "A"
  zone_id = var.zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.dev_api_domain.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.dev_api_domain.cloudfront_zone_id
  }
}