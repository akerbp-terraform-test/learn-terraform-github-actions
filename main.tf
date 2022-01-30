terraform {
  required_providers {
        azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  cloud {
    organization = "AkerBP"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
}

# New resource group
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location
    tags = {
        Environment = "Test"
        Owner = "admin.steinar.schei@akerbp.com"
    }
}

