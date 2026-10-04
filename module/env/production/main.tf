module "resource_group" {
  source = "../../../source/rg"
  vb-rgs = var.vb-rgm

}
module "virtual_network" {
  source   = "../../../source/vnet"
  vb-vnets = var.vb-vnetm
}

module "subnet" {
  source     = "../../../source/subnet"
  vb-subnets = var.vb-subnetm
}

module "bastion_pip" {
  source   = "../../../source/pip"
  vb-pipBs = var.vb-pipBm
}

module "bastion" {
  source     = "../../../source/bastion"
  vb-bastion = var.vb-bastionm
}

module "Network_interface" {
  source  = "../../../source/nic"
  vb-nics = var.vb-nicm
}

module "virtual_machine" {
  source = "../../../source/vm"
  vb-vms = var.vb-vmm
}

module "network_security_group" {
  source = "../../../source/nsg"
  vb-nsg = var.vb-nsgm
}

