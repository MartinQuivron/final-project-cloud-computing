resource "azurerm_storage_account" "blob_storage_project" {
  name                     = "blobstorage${var.random_id}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_storage_container" "blob_storage_container" {
  name                  = "api"
  storage_account_id  = azurerm_storage_account.blob_storage_project.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob_storage" {
  name = "quotes.json"
  source = "${path.module}/quotes.json"
  storage_account_name = azurerm_storage_account.blob_storage_project.name
  storage_container_name = azurerm_storage_container.blob_storage_container.name
  type = "Block"
}