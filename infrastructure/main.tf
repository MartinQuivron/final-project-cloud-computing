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

module "app_gateway" {
  source = "./modules/app_gateway"
  resource_group_name = var.resource_group_name
  location = var.location
  random_id = random_id.random.hex
  subnet_id_app_gateway = module.vnet.subnet_id_app_gateway
  app_service_host = module.app_service.app_service_host
}

module "vnet" {
  source = "./modules/vnet"
  resource_group_name = var.resource_group_name
  location = var.location
  random_id = random_id.random.hex
  subnet_id_app_service = module.vnet.subnet_id_app_service
  subnet_id_db = module.vnet.subnet_id_db
}

module "database" {
    source = "./modules/database"
    resource_group_name = var.resource_group_name
    username_db = var.username_db
    password_db = var.password_db
    random_id = random_id.random.hex
    vnet_id = module.vnet.vnet_id
    subnet_id_db = module.vnet.subnet_id_db
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
  subnet_id_app_service = module.vnet.subnet_id_app_service
  docker_registry_url = var.docker_registry_url
  docker_image        = var.docker_image
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password
}

module "blob_storage" {
  source = "./modules/blob_storage"
  resource_group_name = var.resource_group_name
  random_id = random_id.random.hex
}