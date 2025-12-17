variable "parent_rg" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))

}

# variable "parent_vnet" {
#   type = map(object({
#     vnet_name           = string
#     location            = string
#     resource_group_name = string
#     address_space       = list(string)
#     subnets = map(object({
#       subnet_name             = string
#       subnet_address_prefixes = list(string)
#     }))
#   }))

# }

# variable "parent_nic" {
#   type = map(object({
#     subnet_name                   = string
#     virtual_network_name          = string
#     resource_group_name           = string
#     nic_name                      = string
#     location                      = string
#     ip_configuration_name         = string
#     private_ip_address_allocation = string
#   }))

# }

# variable "parent_nsg" {
#   type = map(object({
#     nsg_name            = string
#     location            = string
#     resource_group_name = string
#     security_rules = map(object({
#       name                   = string
#       priority               = number
#       destination_port_range = string
#     }))
#   }))

# }

# variable "parent_nic_nsg_association" {
#   type = map(object({
#     nic_name            = string
#     nsg_name            = string
#     resource_group_name = string
#   }))

# }

# variable "parent_vm" {
#   type = map(object({
#     vm_name                = string
#     resource_group_name    = string
#     location               = string
#     vm_size                = string
#     key_vault_name         = string
#     image_publisher        = string
#     image_offer            = string
#     image_sku              = string
#     image_version          = string
#     nic_name               = string
#     kv_name                = string
#     kv_resource_group_name = string
#     username_secret_name   = string
#     password_secret_name   = string
#     custom_data_script     = optional(string)
#   }))

# }


# variable "parent_pip" {
#   type = map(object({
#     public_ip_name      = string
#     location            = string
#     resource_group_name = string
#     allocation_method   = string
#     sku                 = string
#   }))
# }

# variable "parent_bastion" {
#   type = map(object({
#     bastion_name         = string
#     location             = string
#     resource_group_name  = string
#     subnet_name          = string
#     virtual_network_name = string
#     public_ip_name       = string
#     bastion_ip_config    = string
#   }))
# }

# variable "parent_lb" {
#   type = map(object({
#     lb_name                        = string
#     location                       = string
#     resource_group_name            = string
#     frontend_ip_configuration_name = string
#     public_ip_name                 = string
#     backend_address_pool_name      = string
#     health_probe_name              = string
#     health_probe_port              = number
#     lb_rule_name                   = string
#     lb_rule_protocol               = string
#     frontend_port                  = number
#     backend_port                   = number
#   }))

# }

# variable "parent_lb_bp_nic_assc" {
#   type = map(object({
#     nic_name                  = string
#     resource_group_name       = string
#     backend_address_pool_name = string
#     ip_configuration_name     = string
#     loadbalancer_name         = string
#   }))

# }

# variable "parent_mssql_server" {
#   type = map(object({
#     mssql_server_name      = string
#     resource_group_name    = string
#     location               = string
#     kv_name                = string
#     kv_resource_group_name = string
#     username_secret_name   = string
#     password_secret_name   = string
#   }))

# }

# variable "parent_mssql_db" {
#   type = map(object({
#     mssql_database_name = string
#     mssql_server_name   = string
#     resource_group_name = string
#   }))

# }

# variable "parent_acr" {
#   type = map(object({
#     acr_name            = string
#     resource_group_name = string
#     location            = string
#     sku                 = string
#   }))
  
# }

# variable "parent_aks" {
#   type = map(object({
#     aks_name                = string
#     location                = string
#     resource_group_name     = string
#     dns_prefix              = string
#     kubernetes_version      = string
#     default_node_pool = object({
#       name                  = string
#       node_count            = number
#       vm_size               = string
#       max_pods              = number
#       auto_scaling_enabled  = bool
#       min_count             = number
#       max_count             = number
#     })
#     identity = object({
#       type = string
#     })
#     network_profile = object({
#       network_plugin    = string
#       network_policy    = string
#     })
#     acr_name                 = string
#     acr_resource_group_name  = string
#     acr_pull_role_name       = string
#     skip_aad_check           = bool
#   }))
  
# }