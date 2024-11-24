resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-${var.random_id}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"  
}

resource "azurerm_application_gateway" "app_gateway" {
    name = "app-gateway-${var.random_id}"
    resource_group_name = var.resource_group_name
    location = var.location
    sku {
        name = "Standard_v2"
        tier = "Standard_v2"
        capacity = 2
    }
    gateway_ip_configuration {
        name = "app-gateway-ip-configuration-${var.random_id}"
        subnet_id = var.subnet_id_app_gateway
    }

    frontend_port {
        name = "app-gateway-frontend-port-${var.random_id}-feport"
        port = 80
    }

    frontend_ip_configuration {
        name = "app-gateway-frontend-ip-configuration-${var.random_id}-feip"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }

    backend_address_pool {
        name = "app-gateway-backend-address-pool-${var.random_id}-beap"
        fqdns = [var.app_service_host]
    }

    backend_http_settings {
        name = "app-gateway-http-settings-${var.random_id}-behttp"
        cookie_based_affinity = "Disabled"
        port = 80
        path = "/"
        protocol = "Http"
        request_timeout = 10
    }

    http_listener {
        name = "app-gateway-http-listener-${var.random_id}-httpl"
        frontend_ip_configuration_name = "app-gateway-frontend-ip-configuration-${var.random_id}-feip"
        frontend_port_name = "app-gateway-frontend-port-${var.random_id}-feport"
        protocol = "Http"
    }

    request_routing_rule {
        name = "app-gateway-request-routing-rule-${var.random_id}-rqrt"
        rule_type = "Basic"
        http_listener_name = "app-gateway-http-listener-${var.random_id}-httpl"
        backend_address_pool_name = "app-gateway-backend-address-pool-${var.random_id}-beap"
        backend_http_settings_name = "app-gateway-http-settings-${var.random_id}-behttp"
        priority = 100
    }
}