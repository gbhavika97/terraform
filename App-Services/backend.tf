terraform {
  backend "azurerm" {
   resource_group_name  = "testrg"
   storage_account_name = "healthcareus3"
   container_name       = "terraform"
   key                  = "dev.tfstate"
  }
}