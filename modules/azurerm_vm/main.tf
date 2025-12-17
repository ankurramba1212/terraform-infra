
data "azurerm_key_vault" "kv_data" {
  for_each            = var.child_vm
  name                = each.value.kv_name
  resource_group_name = each.value.kv_resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each            = var.child_vm
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each            = var.child_vm
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
}

data "azurerm_network_interface" "nic_data" {
  for_each            = var.child_vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.child_vm
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.password[each.key].value

  network_interface_ids = [
    data.azurerm_network_interface.nic_data[each.key].id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  custom_data = (each.value.custom_data_script != null ? base64encode(each.value.custom_data_script) : null)

}
