resource "azurerm_postgresql_flexible_server" "postgresql-server"{
    name                = "postgresql-server-${var.random_id}"
    resource_group_name = var.resource_group_name
    location            = var.location
    sku_name            = "B_Standard_B1ms"
    storage_mb          = 32768
    administrator_login = var.username_db
    administrator_password = var.password_db
    version = "16"
    public_network_access_enabled = false
}