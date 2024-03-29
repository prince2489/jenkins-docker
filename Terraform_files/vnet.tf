locals {
  fixed = "Trunk"
}

resource "azurerm_virtual_network" "v_net" {
  depends_on          = [azurerm_resource_group.res_grp]
  name                = "Virtual_Network-${local.fixed}"
  location            = var.custom_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_addr
  tags                = var.tags
}



resource "azurerm_subnet" "subnets" {
  count                = 2
  name                 = "subnet-${count.index + 1}-${local.fixed}"
  resource_group_name  = azurerm_resource_group.res_grp.name
  virtual_network_name = azurerm_virtual_network.v_net.name
  address_prefixes     = ["192.168.${count.index + 1}.0/24"]
}
