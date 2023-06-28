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
variable "primary_endpoint_resource_id" {
  type    = string
  default = ""
}
variable "secondary_endpoint_resource_id" {
  type    = string
  default = ""
}