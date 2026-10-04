vb-rgm = {
  rg1 = {
    name     = "rg-vb-prod-ci-01"
    location = "centralindia"
  }

  rg2 = {
    name     = "rg-vb-prod-si-02"
    location = "southindia"
  }
}

vb-vnetm = {
  vnet1 = {
    name                = "vnet-vb-prod-ci-01"
    location            = "centralindia"
    resource_group_name = "rg-vb-prod-ci-01"
    address_space       = ["12.13.0.0/20"]
  }

  vnet2 = {
    name                = "vnet-vb-prod-si-02"
    location            = "southindia"
    resource_group_name = "rg-vb-prod-si-02"
    address_space       = ["172.17.0.0/20"]
  }
}

vb-subnetm = {
  subnet1 = {
    name                 = "subnet-vb-prod-01"
    resource_group_name  = "rg-vb-prod-ci-01"
    virtual_network_name = "vnet-vb-prod-ci-01"
    address_prefixes     = ["12.13.0.0/21"]
  }
  subnet2 = {
    name                 = "subnet-vb-prod-02"
    resource_group_name  = "rg-vb-prod-si-02"
    virtual_network_name = "vnet-vb-prod-si-02"
    address_prefixes     = ["172.17.0.0/20"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-vb-prod-ci-01"
    virtual_network_name = "vnet-vb-prod-ci-01"
    address_prefixes     = ["12.13.8.0/21"]
  }
}

vb-pipBm = {
  name                = "Bastion-pip"
  location            = "centralindia"
  resource_group_name = "rg-vb-prod-ci-01"
  allocation_method   = "Static"
  sku                 = "Standard"
}

vb-bastionm = {
  name                 = "bastion-vb-prod"
  location             = "centralindia"
  resource_group_name  = "rg-vb-prod-ci-01"
  pip_name             = "Bastion-pip"
  subnet_name          = "AzureBastionSubnet"
  virtual_network_name = "vnet-vb-prod-ci-01"

  ip_configuration = {
    name = "bastion"
  }
}

vb-nicm = {
  nic1 = {
    name                 = "vb-nic-01"
    location             = "centralindia"
    resource_group_name  = "rg-vb-prod-ci-01"
    subnet_name          = "subnet-vb-prod-01"
    virtual_network_name = "vnet-vb-prod-ci-01"
    ip_configuration = {
      name                          = "vmip1"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic2 = {
    name                 = "vb-nic-02"
    location             = "southindia"
    resource_group_name  = "rg-vb-prod-si-02"
    subnet_name          = "subnet-vb-prod-02"
    virtual_network_name = "vnet-vb-prod-si-02"
    ip_configuration = {
      name                          = "vmip2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

vb-vmm = {
  vm1 = {
    name                = "vb1"
    resource_group_name = "rg-vb-prod-ci-01"
    location            = "centralindia"
    size                = "Standard_F2"
    admin_username      = "vb1"
    admin_password      = "vb@1234567890"
    nic_name            = "vb-nic-01"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }

  vm2 = {
    name                = "vb2"
    resource_group_name = "rg-vb-prod-si-02"
    location            = "southindia"
    size                = "Standard_F2"
    admin_username      = "vb2"
    admin_password      = "vb@1234567890"
    nic_name            = "vb-nic-02"


    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
}

vb-nsgm = {
  nsg1 = {
    name                = "nsg1"
    location            = "centralindia"
    resource_group_name = "rg-vb-prod-ci-01"

    security_rule = {
      name                       = "test1"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    tags = {
      environment = "Production1"
    }
  }
  nsg2 = {
    name                = "nsg2"
    location            = "southindia"
    resource_group_name = "rg-vb-prod-si-02"

    security_rule = {
      name                       = "test2"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    tags = {
      environment = "Production2"
    }
  }
}




















