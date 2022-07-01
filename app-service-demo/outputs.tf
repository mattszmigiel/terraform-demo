output "app_name" {
  value = azurerm_windows_web_app.web_app.name
}

output "app_url" {
  value = "https://${azurerm_windows_web_app.web_app.default_hostname}"
}
