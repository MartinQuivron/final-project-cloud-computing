output "storage_account_url" {
  value = azurerm_storage_account.blob_storage_project.primary_blob_endpoint
}

output "storeage_account_name" {
  value = azurerm_storage_account.blob_storage_project.name
}