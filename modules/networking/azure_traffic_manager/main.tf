resource "azurerm_traffic_manager_profile" "dr-tm" {
  name                   = var.name
  resource_group_name    = var.rgname
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = "yourdns.com"
    ttl           = 30
  }

  monitor_config {
    protocol                    = "HTTPS"
    port                        = 443
    path                        = "/"
    expected_status_code_ranges = ["200-202", "301-302"]
  }
}


resource "azurerm_traffic_manager_external_endpoint" "app_gateway_primary" {
  name              = "primary-enpoint"
  profile_id        = azurerm_traffic_manager_profile.dr-tm.id
  target            = var.primary_hostname
  endpoint_location = var.primary_location
  weight            = 100
}

resource "azurerm_traffic_manager_external_endpoint" "app_gateway_secondary" {
  name              = "secondary--enpoint"
  profile_id        = azurerm_traffic_manager_profile.dr-tm.id
  target            = var.secondary_hostname
  endpoint_location = var.secondary_location
  weight            = 50
}
