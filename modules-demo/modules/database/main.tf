resource "azurerm_mssql_server" "my_sqlserver" {
  name                         = "${var.prefix}-sqlsvr"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "my_sqldb" {
  name         = "${var.prefix}-sqldb"
  server_id    = azurerm_mssql_server.my_sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "Basic"
}

resource "azurerm_mssql_firewall_rule" "firewall_rule" {
  name             = "allow-azure-services"
  server_id        = azurerm_mssql_server.my_sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
