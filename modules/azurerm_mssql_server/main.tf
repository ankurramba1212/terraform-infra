data "azurerm_key_vault" "kv_data" {
  for_each            = var.child_mssql_server
  name                = each.value.kv_name
  resource_group_name = each.value.kv_resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each            = var.child_mssql_server
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each            = var.child_mssql_server
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
}


resource "azurerm_mssql_server" "mssqlserver" {
  for_each                     = var.child_mssql_server
  name                         = each.value.mssql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.password[each.key].value

}
