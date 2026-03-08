resource "azurerm_virtual_machine" "this" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.rg_name
  vm_size               = var.vm_size
  network_interface_ids = [var.nic_id]

  # Required OS disk
  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Required image reference
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = "azureuser"
    admin_password = "P@ssword123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}