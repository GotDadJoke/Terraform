//global variables to use in any terraform file

//id of aws account(not a specific user)
variable "ACCOUNT_ID" {
  type    = string
  default = "############"
}
variable "region" {
  type    = string
  default = "##-####-#"
}
//hosted zone for domain gotdadjoke.com
variable "zone_id" {
  type    = string
  default = "#####################"
}
