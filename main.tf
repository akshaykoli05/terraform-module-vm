resource "azurerm_virtual_machine" "this" {
  name                  = "azwacatsd${var.vm_suffix}"
  location              = var.location
  resource_group_name   = var.rg_name
  vm_size               = var.vm_size
  network_interface_ids = [var.nic_id]

  storage_os_disk {
    name              = "azwacatsd${var.vm_suffix}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "azwacatsd${var.vm_suffix}"
    admin_username = "azureuser"
    admin_password = "P@ssword123!"
  }

  # ✅ Required for Windows VM
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}