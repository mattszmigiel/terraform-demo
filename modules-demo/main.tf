provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource-group"
  prefix   = var.prefix
  location = var.location
}

module "app_service" {
  source              = "./modules/app-service"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  depends_on = [
    module.resource_group
  ]
}

module "storage_account" {
  source              = "./modules/storage-account"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  depends_on = [
    module.resource_group
  ]
}

