locals {
  fixe = "Trunk"
}
resource "azurerm_network_interface" "nic" {
  name                = "nic-${local.fixe}"
  location            = azurerm_resource_group.res_grp.location
  resource_group_name = azurerm_resource_group.res_grp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "vm-${local.fixe}"
  resource_group_name             = azurerm_resource_group.res_grp.name
  location                        = azurerm_resource_group.res_grp.location
  size                            = "Standard_B1s"
  admin_username                  = "raja"
  disable_password_authentication = false
  admin_password                  = "Abc@1234"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  #   provisioner "file" {
  #     content     = file("init.sh")
  #     destination = "/tmp/init.sh"
  #   }
  custom_data = filebase64("init.sh")
}
