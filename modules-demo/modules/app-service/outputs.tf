output "app_name" {
  value = azurerm_windows_web_app.web_app_windows.name
}

output "app_url" {
  value = "https://${azurerm_windows_web_app.web_app_windows.default_hostname}"
}
