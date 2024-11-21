provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "postgresql-server"{
    name                = "postgresql-server-final-project15"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    sku_name            = "B_Standard_B1ms"
    storage_mb          = 32768
    administrator_login = var.username_db
    administrator_password = var.password_db
    version = "16"
    public_network_access_enabled = false
}

resource "azurerm_service_plan" "service_plan_project" {
  name                = "service-plan-final-project15"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}
resource "azurerm_app_service" "app_service_project" {
  name                = "app-service-final-project15"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.service_plan_project.id
}