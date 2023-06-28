//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = "RG-demo-SQL"
}
variable "sqlservername" {
  type    = string
  default = "demo-sql=100121"
}

variable "location" {
  type    = string
  default = "West US"
}
//-----------------------------------SQL CONFIGURATIONS-------------------\\
variable "username" {
  type    = string
  default = "adminuser"
}
variable "password" {
  type    = string
  default = "M@gento12345"
}
variable "dbname" {
  type    = string
  default = "demosqldemodb"
}
variable "dbsize" {
  type    = string
  default = "10"
}
variable "sku_name" {
  type    = string
  default = "demosqldemodb"
}
variable "db_version" {
  type    = string
  default = "10"
}

variable "firewallrules" {
  type = list(any)
  default = [
    {
      startip = "10.0.0.1"
      endip   = "10.0.0.1"
    },
    {
      startip = "10.0.0.2"
      endip   = "10.0.0.2"
    }
  ]
}
//------------------------------------TAGS-------------------------\\
variable "owner" {
  type        = string
  default     = "Ali Arslan"
  description = "description"
}

variable "Environment" {
  type        = string
  default     = "Dev"
  description = "Enter storage account name"
}

