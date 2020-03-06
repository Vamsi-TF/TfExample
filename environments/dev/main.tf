

provider "azurerm" {
    version         =   "2.0.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    subscription_id =   var.subscription_id

    features {} # Must be declared for ARM TF provider 2.0
}

module "VM" {
    source          =   "../../modules/compute"
    nicName         =   var.nicName
    publicIpName    =   var.publicIpName
    vmName          =   var.vmName
    os_disk_name    =   var.os_disk_name
    computer_name   =   var.computer_name
    admin_password  =   var.admin_password   
}

