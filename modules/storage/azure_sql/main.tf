resource "azurerm_sql_server" "demo" {
  name                         = var.sqlservername
  resource_group_name          = azurerm_resource_group.demo.name
  location                     = azurerm_resource_group.demo.location
  version                      = var.version
  administrator_login          = var.username
  administrator_login_password = var.password
  tags = {
    Environment = var.Environment
  }
}
resource "azurerm_mssql_database" "demo" {
  name           = var.dbname
  server_id      = azurerm_sql_server.demo.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.dbsize
  read_scale     = true
  sku_name       = var.sku_name
  zone_redundant = false

  tags = {
    Environment = var.Environment
  }
}

