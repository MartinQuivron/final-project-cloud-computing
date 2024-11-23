resource "azurerm_service_plan" "service_plan_project" {
  name                = "service-plan-${var.random_id}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}
resource "azurerm_app_service" "app_service_project" {
  name                = "app-service-${var.random_id}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.service_plan_project.id
}