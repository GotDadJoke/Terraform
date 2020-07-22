//global variables to use in any terraform file

//id of aws account(not a specific user)
variable "ACCOUNT_ID" {
  type    = string
  default = "894771629905"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
//hosted zone for domain gotdadjoke.com
variable "zone_id" {
  type    = string
  default = "Z05781173UOCB80T1C5N4"
}
