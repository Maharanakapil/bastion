data "azurerm_subnet" "data_subnet" {
  for_each = var.vb-nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

