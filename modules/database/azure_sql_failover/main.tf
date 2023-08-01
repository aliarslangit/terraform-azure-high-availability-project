resource "azurerm_mssql_failover_group" "sql-database-failover" {
  name      = "sql-database-failover"
  server_id = var.primary_server_id
  databases = [
   var.primary_db_id,
   var.secondary_db_id
  ]
  partner_server {
    id = var.secondary_server_id
  }
  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }

}