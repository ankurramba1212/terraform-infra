data "azurerm_subnet" "subnet_data" {
  for_each             = var.child_bastion
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.child_bastion
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.child_bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.bastion_ip_config
    subnet_id            = data.azurerm_subnet.subnet_data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}
