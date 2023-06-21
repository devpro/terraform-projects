resource "azurerm_resource_group" "management" {
  name     = "rg-${var.azure_resource_suffix}"
  location = var.azure_location
}

resource "azurerm_kubernetes_cluster" "management" {
  name                = "aks-${var.azure_resource_suffix}"
  location            = azurerm_resource_group.management.location
  resource_group_name = azurerm_resource_group.management.name
  dns_prefix          = "dns-${var.azure_resource_suffix}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
