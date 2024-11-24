output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id_db" {
  value = azurerm_subnet.subnet_db.id
}

output "subnet_id_app_service" {
  value = azurerm_subnet.subnet_app_service.id
}

output "subnet_id_app_gateway" {
  value = azurerm_subnet.subnet_app_gateway.id
}