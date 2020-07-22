//create certificate for domain
module "acm_certificate" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=tags/0.5.0"
  domain_name               = "gotdadjoke.com"
  subject_alternative_names = ["*.gotdadjoke.com", "www.gotdadjoke.com"]
  tags = {
    "name"    = "default-certificate",
    "project" = "gotdadjokes"
  }
  zone_name = "gotdadjoke.com"
}
