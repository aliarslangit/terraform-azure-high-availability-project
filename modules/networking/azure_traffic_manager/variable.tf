//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = "RG-demo-SQL"
}
variable "name" {
  type    = string
  default = "demo-sql=100121"
}

//-----------------------------------TM CONFIGURATIONS-------------------\\
variable "primary_endpoint_resource_id" {
  type    = string
  default = "adminuser"
}
variable "secondary_endpoint_resource_id" {
  type    = string
  default = "M@gento12345"
}