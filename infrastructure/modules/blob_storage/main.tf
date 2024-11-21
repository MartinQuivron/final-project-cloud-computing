resource "azurerm_storage_account" "blob_storage_project" {
  name                     = "blobstoragefproject15"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_storage_container" "blob_storage_container" {
  name                  = "containerfproject15"
  storage_account_id  = azurerm_storage_account.blob_storage_project.id
  container_access_type = "private"
}