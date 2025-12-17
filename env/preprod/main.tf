module "rg" {
  source   = "../../modules/azurerm_rg"
  child_rg = var.parent_rg
}

# module "vnet" {
#   depends_on = [module.rg]
#   source     = "../../modules/azurerm_vnet"
#   child_vnet = var.parent_vnet
# }

# module "nic" {
#   depends_on = [module.vnet]
#   source     = "../../modules/azurerm_nic"
#   child_nic  = var.parent_nic
# }

# module "nsg" {
#   depends_on = [module.nic]
#   source     = "../../modules/azurerm_nsg"
#   child_nsg  = var.parent_nsg
# }

# module "nic_nsg_association" {
#   depends_on = [module.nsg, module.nic]
#   source     = "../../modules/azurerm_nic_nsg_assc"
#   child_nic_nsg_association = var.parent_nic_nsg_association
# }

# module "vm" {
#   depends_on = [module.nic_nsg_association]
#   source     = "../../modules/azurerm_vm"
#   child_vm   = var.parent_vm
# }

# module "pip" {
#     depends_on = [ module.rg ]
#     source     = "../../modules/azurerm_pip"
#     child_pip  = var.parent_pip
  
# }

# module "bastion" {
#     depends_on = [ module.pip, module.vnet ]
#     source     = "../../modules/azurerm_bastion"
#     child_bastion  = var.parent_bastion
  
# }

# module "lb" {
#     depends_on = [ module.pip ]
#     source     = "../../modules/azurerm_lb"
#     child_lb  = var.parent_lb
  
# }

# module "nic_bp_assc" {
#     depends_on = [ module.lb, module.nic ]
#     source     = "../../modules/azurerm_lb_bp_nic_assc"
#     child_lb_bp_nic_assc  = var.parent_lb_bp_nic_assc
  
# }

# module "mssqlserver" {
#     depends_on = [ module.rg ]
#     source     = "../../modules/azurerm_mssql_server"
#     child_mssql_server  = var.parent_mssql_server
  
# }

# module "mssqldatabase" {
#     depends_on = [ module.mssqlserver ]
#     source     = "../../modules/azurerm_mssql_database"
#     child_mssql_db  = var.parent_mssql_db
  
# }

# module "acr" {
#   depends_on = [ module.rg ]
#   source     = "../../modules/azurerm_acr"
#   child_acr  = var.parent_acr
# }

# module "aks" {
#   depends_on = [ module.acr,module.nic ]
#   source     = "../../modules/azurerm_aks"
#   child_aks  = var.parent_aks
# }