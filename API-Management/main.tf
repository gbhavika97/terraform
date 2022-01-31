resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_api_management" "demoapi" {
  name                = var.api_management_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = var.api_management_publisher_name
  publisher_email     = var.api_management_publisher_email

  sku_name = var.api_management_sku_name
}