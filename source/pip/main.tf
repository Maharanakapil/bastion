resource "azurerm_public_ip" "pipB" {
  name                = var.vb-pipBs.name
  location            = var.vb-pipBs.location
  resource_group_name = var.vb-pipBs.resource_group_name
  allocation_method   = var.vb-pipBs.allocation_method
  sku                 = var.vb-pipBs.sku
}
