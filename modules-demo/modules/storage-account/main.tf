resource "azurerm_storage_account" "storage" {
  name                = "${var.prefix}storageacct"
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier                    = "Standard"
  account_kind                    = "StorageV2"
  account_replication_type        = "LRS"
  enable_https_traffic_only       = true
  access_tier                     = "Hot"
  allow_nested_items_to_be_public = true
}

resource "azurerm_storage_container" "container" {
  name                  = "${var.prefix}storagecontainer"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "blob"
}
