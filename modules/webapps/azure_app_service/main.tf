
resource "azurerm_linux_web_app" "example" {
  name                  = var.appname
  location              = var.location
  resource_group_name   = var.rgname
  service_plan_id       = var.aspid

  site_config {}

}