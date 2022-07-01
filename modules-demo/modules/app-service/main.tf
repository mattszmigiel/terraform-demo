resource "azurerm_service_plan" "service_plan" {
  name                = "${var.prefix}-sp"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "web_app_windows" {
  name                = "${var.prefix}-webapp-windows"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}
