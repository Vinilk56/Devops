provider "azurerm" {
  features {}
}

# Resource Group for backend
resource "azurerm_resource_group" "tfstate_rg" {
  name     = "tfstate-rg"
  location = "East US"
}

# Random suffix to ensure globally unique storage account name
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# Storage Account for backend
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstate${random_string.suffix.result}" # must be globally unique
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container for backend
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"
}
