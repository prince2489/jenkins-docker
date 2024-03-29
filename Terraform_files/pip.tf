resource "azurerm_public_ip" "pip" {
  name                = "publicip-Trunk"
  location            = azurerm_resource_group.res_grp.location
  resource_group_name = azurerm_resource_group.res_grp.name
  allocation_method   = "Dynamic"
}
