provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "random_id" "random" {
  byte_length = 6
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source = "./modules/vnet"
  resource_group_name = var.resource_group_name
  location = var.location
  random_id = random_id.random.hex
}

module "database" {
    source = "./modules/database"
    resource_group_name = var.resource_group_name
    username_db = var.username_db
    password_db = var.password_db
    random_id = random_id.random.hex
}

module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = var.resource_group_name
  random_id = random_id.random.hex
  database_host       = module.database.database_host
  storage_account_url = module.blob_storage.storage_account_url
  username_db         = var.username_db
  password_db         = var.password_db
  database_name       = module.database.database_name
}

module "blob_storage" {
  source = "./modules/blob_storage"
  resource_group_name = var.resource_group_name
  random_id = random_id.random.hex
}