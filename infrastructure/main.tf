provider "azurerm" {
  features {}
  subscription_id = "a8fd8362-8b57-4522-9cbf-1f60943a272c"
}

resource "azurerm_resource_group" "rg" {
  name     = "finalProject"
  location = "France Central"
}