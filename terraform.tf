# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Define variables
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "location" {
  description = "Location for the storage account"
  type        = string
  default     = "West Europe"
}

# Create the storage account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = var.location
}

# Output the storage account endpoint
output "storage_account_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}