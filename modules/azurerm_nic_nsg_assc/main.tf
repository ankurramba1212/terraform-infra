
data "azurerm_network_interface" "nic_data" {
  for_each            = var.child_nic_nsg_association
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.child_nic_nsg_association
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  for_each                  = var.child_nic_nsg_association
  network_interface_id      = data.azurerm_network_interface.nic_data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}
