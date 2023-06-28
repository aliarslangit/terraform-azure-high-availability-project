resource "azurerm_traffic_manager_profile" "example" {
  name                  = var.name
  resource_group_name   = var.rgname
  traffic_routing_method = "Performance"
}


resource "azurerm_traffic_manager_endpoint" "app_gateway_primary" {
  name                         = "primary-app-gateway"
  resource_group_name          = var.rgname
  profile_name                 = azurerm_traffic_manager_profile.example.name
  type                         = "AzureEndpoints"
  target_resource_id           = var.primary_endpoint_resource_id
  routing_weight               = 50
  endpoint_monitor_status      = "Enabled"
  endpoint_monitor_interval    = 30
  endpoint_monitor_timeout     = 10
  endpoint_monitor_tolerance   = 3
}

resource "azurerm_traffic_manager_endpoint" "app_gateway_primary_secondary" {
  name                         = "secondary--app-gateway"
  resource_group_name          = var.rgname
  profile_name                 = azurerm_traffic_manager_profile.example.name
  type                         = "AzureEndpoints"
  target_resource_id           = var.secondary_endpoint_resource_id
  routing_weight               = 50
  endpoint_monitor_status      = "Enabled"
  endpoint_monitor_interval    = 30
  endpoint_monitor_timeout     = 10
  endpoint_monitor_tolerance   = 3
}
