# Define o provedor Azure
provider "azurerm" {
  features {}
}

# Cria um grupo de recursos
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Cria um App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Premium"
    size = "P1v3"
  }
}

# Cria o App Service
resource "azurerm_app_service" "example" {
  name                = "example-appservice"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }
}

# Saída
output "app_service_name" {
  value = azurerm_app_service.example.name
}
