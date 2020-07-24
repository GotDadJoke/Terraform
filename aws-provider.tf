//terraform access to AWS. A specific role created with all required permissions.
provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${var.ACCOUNT_ID}:role/terraform-role"
  }
  region = var.region
  version = "v2.70.0"
}