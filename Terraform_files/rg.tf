resource "azurerm_resource_group" "res_grp" {
  name     = var.rg_name
  location = var.custom_location
}
