resource "aws_route53_record" "api_domain_record" {
  zone_id = var.zone_id //no changes needed, see variables.tf file
  name    = "api.gotdadjoke.com"
  type    = "string"
  ttl     = "300" //time to live, default is ok
  records = [""] //list of strings resources to point to
}

