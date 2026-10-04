data "azurerm_subnet" "data_bastion_subnet" {
  name                 = var.vb-bastion.subnet_name
  virtual_network_name = var.vb-bastion.virtual_network_name
  resource_group_name  = var.vb-bastion.resource_group_name
}

data "azurerm_public_ip" "data_pip" {
  name                = var.vb-bastion.pip_name
  resource_group_name = var.vb-bastion.resource_group_name
}