resource "azurerm_resource_group" "management" {
  name     = "rg-${var.resource_suffix}"
  location = var.azure_location

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_kubernetes_cluster" "management" {
  name                = "aks-${var.resource_suffix}"
  location            = azurerm_resource_group.management.location
  resource_group_name = azurerm_resource_group.management.name
  dns_prefix          = "dns-${var.resource_suffix}"
  tags                = var.resource_tags

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.azure_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    # limitation: has to be a static list expression (see https://github.com/hashicorp/terraform/issues/22544), cannot be read from variable
    ignore_changes = [
      # tags.field1
      # tags["Field 1"]
    ]
  }
}
