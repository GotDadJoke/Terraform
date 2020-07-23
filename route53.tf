resource "aws_route53_record" "your-name-here" {
  zone_id = var.zone_id //no changes needed, see variables.tf file
  name    = "type-what-you-need.gotdadjoke.com"
  type    = "use type you need"
  ttl     = "300" //time to live, default is ok
  records = [""] //list of strings resources to point to
}

//documentation: https://www.terraform.io/docs/backends/config.html