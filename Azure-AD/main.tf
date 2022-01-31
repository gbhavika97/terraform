terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "1.1.1"
    }
  }
}

provider "azuread" {
    tenant_id = "407f5747-a5e8-492a-a3d2-09240b831c51"
  
}

# Create an Application
resource "azuread_application" "adapp" {
    name = "myapplication"
}

# Create a service principle
resource "azuread_service_principal" "mysp" {
    application_id = azuread_application.adapp.application_id
}

# Create User
resource "azuread_user" "user" {
    user_principal_name = "gbhavika@algarisateeshazure84gmail.onmicrosoft.com"
    display_name = "Gbhavika"
    password = "Microsoft@123"
}

# Create a Group
resource "azuread_group" "mygroup" {
    name = "myterraformgroup"
     members = [
    azuread_user.user.object_id,
    /* more users */
  ]
}

