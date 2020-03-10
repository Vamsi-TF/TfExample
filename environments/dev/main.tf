
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "Dev-RG"
#     storage_account_name = "vamsitfbackend2020"
#     container_name       = "tfbackend"
#     key                  = "dev.terraform.tfstate"
#   }
# }

provider "azurerm" {
    version         =   "2.0.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    subscription_id =   var.subscription_id

    features {} # Must be declared for ARM TF provider 2.0
}

# Resource Group

module "RG" {
  source              =   "../../modules/resourcegroups" 
}

# Network

# module "NETWORK" {
#   source              =   "../../modules/network"
# }

# Virtual Machines

# module "VM" {
#     source          =   "../../modules/compute"
#     nicName         =   var.nicName
#     publicIpName    =   var.publicIpName
#     vmName          =   var.vmName
#     os_disk_name    =   var.os_disk_name
#     computer_name   =   var.computer_name
#     admin_password  =   var.admin_password   
# }

# Storage

# module "SA" {
#     source          =   "../../modules/storage"
# }

