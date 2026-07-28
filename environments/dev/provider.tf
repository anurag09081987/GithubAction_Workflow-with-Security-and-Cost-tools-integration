terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }
  backend "azurerm" {
      resource_group_name = "anuraglocked"
      storage_account_name = "anuraglocked"
      container_name = "anuragcontainer"
      key = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "5162d39b-a4ed-44f0-91aa-9884962cf062"
}