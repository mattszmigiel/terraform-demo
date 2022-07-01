output "sql_server_fqdn" {
  value = azurerm_mssql_server.my_sqlserver.fully_qualified_domain_name
}

output "database_name" {
  value = azurerm_mssql_database.my_sqldb.name
}
