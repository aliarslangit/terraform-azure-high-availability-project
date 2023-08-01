//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = ""
}
variable "sqlservername" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}
//-----------------------------------SQL CONFIGURATIONS-------------------\\
variable "primary_server_id" {
  type    = string
  default = ""
}
variable "secondary_server_id" {
  type    = string
  default = ""
}
variable "primary_db_id" {
  type    = string
  default = ""
}
variable "secondary_db_id" {
  type    = string
  default = ""
}