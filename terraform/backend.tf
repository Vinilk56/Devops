provider "azurerm" {
  features {}
}

# Resource Group for backend
resource "azurerm_resource_group" "tfstate_rg" {
  name     = "tfstate-rg"
  location = "East US"
}

# Storage Account for backend
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstateaccount1"   # must be globally unique
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container for backend
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"
}
