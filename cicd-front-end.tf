module "codepipeline-s3" {
  source = "git::https://github.com/AlyonaTiki/terraform-aws-codepipeline.git?ref=tags/v0.1.4"
  bucket-codepipeline = module.frontend_s3_bucket_deploy.bucket_id
  bucket-destination = "dev-front-end-gotdadjoke"
  oauthtoken = auth-token
  repo = "Front-End"
  owner = "GotDadJoke"
  name = "front-end-deploy"
  stage   = "dev"
}

//create/update S3 bucket for CodePipeline
module "frontend_s3_bucket_deploy" {
  source  = "git::https://github.com/cloudposse/terraform-aws-s3-bucket.git?ref=tags/0.14.0"
  enabled = true
  name    = "codepipeline-front-end-gotdadjokes"
  stage   = "dev"
}