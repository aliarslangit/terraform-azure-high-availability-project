//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = ""
}
variable "name" {
  type    = string
  default = ""
}

//-----------------------------------TM CONFIGURATIONS-------------------\\
variable "primary_hostname" {
  type    = string
  default = ""
}
variable "secondary_hostname" {
  type    = string
  default = ""
}
variable "primary_location" {
  type    = string
  default = ""
}
variable "secondary_location" {
  type    = string
  default = ""
}