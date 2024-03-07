### Configure providers

terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/azuread/
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2"
    }
    # https://registry.terraform.io/providers/hashicorp/azurerm/
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
    # https://registry.terraform.io/providers/hashicorp/local/
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}

provider "azurerm" {
  features {}
}