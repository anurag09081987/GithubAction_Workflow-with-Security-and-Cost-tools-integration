resource "azurerm_network_interface" "this" {
    for_each = var.vms
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    ip_configuration {
      
      name = each.value.config_name
      subnet_id = data.azurerm_subnet.this[each.key].id
      public_ip_address_id = data.azurerm_public_ip.this[each.key].id
      private_ip_address_allocation = "Dynamic"
    }
}
resource "azurerm_linux_virtual_machine" "this"{
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.rg_name
  size = each.value.vm_size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.this[each.key].id]

os_disk {
  caching = "ReadWrite"
  storage_account_type = "Premium_LRS"
}
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}