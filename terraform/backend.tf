terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    # Service Principal credentials
    subscription_id       = "09285a1f-3651-46ad-bab4-fc044081375f"
    tenant_id             = "15407e1b-ea78-4736-85c2-842f66c7b8db"
    client_id             = "9e83ac78-5bb3-436b-afbc-737e0dfe37ea"
    client_secret         = "hRz8Q~~xbAFIM-XDQBw3YGNe.I4ATV2nw6WMWaUv"
  }
}
