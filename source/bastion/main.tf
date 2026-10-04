resource "azurerm_bastion_host" "vbBastion" {
  name                = var.vb-bastion.name
  location            = var.vb-bastion.location
  resource_group_name = var.vb-bastion.resource_group_name

  ip_configuration {
    name                 = var.vb-bastion.ip_configuration.name 
    subnet_id            = data.azurerm_subnet.data_bastion_subnet.id
    public_ip_address_id = data.azurerm_public_ip.data_pip.id
  }
}