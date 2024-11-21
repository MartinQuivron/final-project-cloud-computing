provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "database" {
    source = "./modules/database"
    resource_group_name = var.resource_group_name
    username_db = var.username_db
    password_db = var.password_db
}

module "app_service" {
  source              = "./modules/app_service"
    resource_group_name = var.resource_group_name
}