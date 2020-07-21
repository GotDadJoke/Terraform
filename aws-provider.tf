provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${var.ACCOUNT_ID}:role/terraform-role"
  }
  region = var.region
}