//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "Rg-git"
}

variable "location" {
  type    = string
  default = "West US"
}
variable "aspname" {
  type    = string
  default = "Rg-git"
}

variable "skusize" {
  type    = string
  default = "S1"
}

variable "os_type" {
  type    = string
  default = "linux"
}