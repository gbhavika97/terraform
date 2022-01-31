# Create Resource Group
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.resource_group_location
}

# Create App Service Plan
resource "azurerm_app_service_plan" "serviceplan" {
    name = var.app_service_plan_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    sku {
      tier = "Standard"
      size = "B1"
    }

    tags = {
       environment = "dev"
    }
}

# Create App Service
resource "azurerm_app_service" "appservice" {
    name = var.app_service_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.serviceplan.id

    site_config {
      dotnet_framework_version = "v4.0"
    }

    tags = {
       environment = "dev"
    }
  
}