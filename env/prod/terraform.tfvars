parent_rg = {
  "rg1" = {
    resource_group_name = "todo-rg-prod"
    location            = "Central US"
  }
}

# parent_vnet = {
#   "vnet1" = {
#     vnet_name           = "todo-vnet-prod"
#     location            = "Central US"
#     resource_group_name = "todo-rg-prod"
#     address_space       = ["10.0.0.0/16"]
#     subnets = {
#       "vm_subnet" = {
#         subnet_name             = "todo-frontend-subnet-prod"
#         subnet_address_prefixes = ["10.0.1.0/26"]
#       }
#       "bastion" = {
#         subnet_name             = "AzureBastionSubnet"
#         subnet_address_prefixes = ["10.0.3.0/26"]
#     } }
# } }

# parent_nic = {
#   "nic1" = {
#     subnet_name                   = "todo-frontend-subnet-prod"
#     virtual_network_name          = "todo-vnet-prod"
#     resource_group_name           = "todo-rg-prod"
#     nic_name                      = "todo-nic-prod"
#     location                      = "Central US"
#     ip_configuration_name         = "todo-ip-config"
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# parent_nsg = {
#   "todonsg" = {
#     nsg_name            = "todo-nsg-prod"
#     location            = "Central US"
#     resource_group_name = "todo-rg-prod"
#     security_rules = {
#       "allow-http" = {
#         name                   = "Allow-HTTP"
#         priority               = 100
#         destination_port_range = "80"
#       }
#       "allow-ssh" = {
#         name                   = "Allow-SSH"
#         priority               = 101
#         destination_port_range = "22"
#       }
#     }

#   }
# }

# parent_nic_nsg_association = {
#   "assoc1" = {
#     nic_name            = "todo-nic-prod"
#     nsg_name            = "todo-nsg-prod"
#     resource_group_name = "todo-rg-prod"
#   }
# }

# parent_vm = {
#   "vm1" = {
#     vm_name                = "todo-vm-prod"
#     resource_group_name    = "todo-rg-prod"
#     key_vault_name         = "todo-kv"
#     location               = "Central US"
#     vm_size                = "Standard_B1s"
#     image_publisher        = "Canonical"
#     image_offer            = "UbuntuServer"
#     image_sku              = "18.04-LTS"
#     image_version          = "latest"
#     nic_name               = "todo-nic-prod"
#     kv_name                = "todo-kv"
#     kv_resource_group_name = "ankur_rg_dont_delete"
#     username_secret_name   = "username"
#     password_secret_name   = "password"
#     custom_data_script     = <<EOT
# #!/bin/bash
# sudo apt update 
# sudo apt install nginx -y
# systemctl start nginx
# git clone https://github.com/devopsinsiders/ReactTodoUIMonolith.git
# cd ReactTodoUIMonolith/
# curl -s https://deb.nodesource.com/setup_16.x | sudo bash
# sudo apt install nodejs -y

# # Build app
# sudo npm install
# sudo npm run build
# sudo cp -r build/* /var/www/html/
# systemctl restart nginx
# EOT

#   }
# }

# parent_pip = {
#   "bastion_pip" = {
#     public_ip_name      = "bastion-pip"
#     location            = "Central US"
#     resource_group_name = "todo-rg-prod"
#     allocation_method   = "Static"
#     sku                 = "Standard"

#   }
#   "lb_pip" = {
#     public_ip_name      = "lb_pip"
#     location            = "Central US"
#     resource_group_name = "todo-rg-prod"
#     allocation_method   = "Static"
#     sku                 = "Standard"
#   }
# }

# parent_bastion = {
#   "bastion" = {
#     bastion_name         = "todo-bastion"
#     location             = "Central US"
#     resource_group_name  = "todo-rg-prod"
#     bastion_ip_config    = "bastion-configuration"
#     subnet_name          = "AzureBastionSubnet"
#     virtual_network_name = "todo-vnet-prod"
#     public_ip_name       = "bastion-pip"

#   }
# }


# parent_lb = {
#   "lb" = {
#     lb_name                        = "todo-lb-prod"
#     location                       = "Central US"
#     resource_group_name            = "todo-rg-prod"
#     frontend_ip_configuration_name = "todo-frontend-config"
#     public_ip_name                 = "lb_pip"
#     backend_address_pool_name      = "todo-backend-pool"
#     health_probe_name              = "todo-health-probe"
#     health_probe_port              = 80
#     lb_rule_name                   = "todo-lb-prod-rule"
#     lb_rule_protocol               = "Tcp"
#     frontend_port                  = 80
#     backend_port                   = 80

#   }
# }

# parent_lb_bp_nic_assc = {
#   "assc1" = {
#     nic_name                  = "todo-nic-prod"
#     resource_group_name       = "todo-rg-prod"
#     ip_configuration_name     = "todo-ip-config"
#     backend_address_pool_name = "todo-backend-pool"
#     loadbalancer_name         = "todo-lb-prod"

#   }
# }

# parent_mssql_server = {
#   "mssql1" = {
#     mssql_server_name      = "todo-mssql-server-prod"
#     resource_group_name    = "todo-rg-prod"
#     location               = "Central US"
#     kv_name                = "todo-kv"
#     kv_resource_group_name = "ankur_rg_dont_delete"
#     username_secret_name   = "db-username"
#     password_secret_name   = "db-password"
#   }
# }

# parent_mssql_db = {
#   "db1" = {
#     mssql_database_name = "todo-mssql-database-prod"
#     mssql_server_name   = "todo-mssql-server-prod"
#     resource_group_name = "todo-rg-prod"

#   }
# }

# parent_acr = {
#   "acr1" = {
#     acr_name            = "todoacrpreprod0121sss"
#     resource_group_name = "todo-rg-prod"
#     location            = "Central US"
#     sku                 = "Standard"
#   }
# }

# parent_aks = {
#   "aks1" = {
#     aks_name            = "todoaks-prod"
#     location            = "Central US"
#     resource_group_name = "todo-rg-prod"
#     dns_prefix          = "todoaks-proddns"
#     kubernetes_version  = "1.32.5"
#     default_node_pool = {
#       name                 = "default"
#       node_count           = 1
#       vm_size              = "Standard_A2_v2"
#       max_pods             = 80
#       auto_scaling_enabled = true
#       min_count            = 1
#       max_count            = 2
#     }
#     identity = {
#       type = "SystemAssigned"
#     }
#     network_profile = {
#       network_plugin = "azure"
#       network_policy = "calico"
#     }
#     acr_name                = "todoacrpreprod0121sss"
#     acr_resource_group_name = "todo-rg-prod"
#     acr_pull_role_name      = "AcrPull"
#     skip_aad_check          = false
#   }
# }
