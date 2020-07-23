module "terraform_state_backend" {
  source        = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.18.2"
  namespace     = "gdj"
  name          = "terraform"
  region        = "us-east-1"
  force_destroy                      = false
}
terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "gdj-terraform-state"
    key = "terraform.tfstate"
    dynamodb_table = "gdj-terraform-state-lock"
    role_arn = "arn:aws:iam::894771629905:role/terraform-role"
    encrypt = true
  }
}