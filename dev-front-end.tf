//create/update S3 bucket
module "frontend_s3_bucket" {
  source  = "git::https://github.com/cloudposse/terraform-aws-s3-bucket.git?ref=tags/0.14.0"
  enabled = true
  name    = "front-end-gotdadjoke"
  stage   = "dev"
}

//create/update Coudfront
module "frontend_cdn" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=tags/0.27.0"
  stage                     = "dev"
  name                      = "front-end-gotdadjoke"
  aliases                   = ["dev.gotdadjoke.com"]
  parent_zone_id            = var.zone_id
  origin_bucket             = module.frontend_s3_bucket.bucket_id
  wait_for_deployment       = false
  geo_restriction_locations = ["US", "CA"]
  geo_restriction_type      = "whitelist"
  logging_enabled           = false
  acm_certificate_arn       = module.acm_certificate.arn
}
