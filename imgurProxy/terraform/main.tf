terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

variable "imgur_client_id" {
  type = string
}
variable "port" {
  type    = string
  default = "3000"

}

resource "azurerm_resource_group" "main" {
  name     = "mt-diagrams"
  location = "West Europe"
}

resource "azurerm_service_plan" "main" {
  name                = "mt-diagram-service-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "main" {
  name                = "imgurproxy-app-service"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.main.id

  https_only = true

  app_settings = {
    "PORT"            = var.port
    "IMGUR_CLIENT_ID" = var.imgur_client_id
  }
  site_config {
    always_on = false

    application_stack {
      docker_image     = "perlt/imgurproxy"
      docker_image_tag = "latest"
    }
  }

}

