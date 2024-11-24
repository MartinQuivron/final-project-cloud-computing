resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.random_id}"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_prefixes)
  name                = "subnet-${var.random_id}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = [var.subnet_prefixes[count.index]]
}