

resource "azurerm_resource_group" "rg" {
    name                        =   var.rgName
    location                    =   var.location
}

resource "azurerm_storage_account" "terraform-sa" {
    name                        =       var.saName
    resource_group_name         =       data.azurerm_resource_group.rg.name
    location                    =       data.azurerm_resource_group.rg.location
    account_tier                =       var.account_tier
    account_replication_type    =       var.account_replication_type
    enable_https_traffic_only   =       true
    tags                        =       var.tags
}

resource "azurerm_storage_container" "terraform-sc" {
    name                        =       var.scName
    storage_account_name        =       azurerm_storage_account.terraform-sa.name
    container_access_type       =       var.container_access_type
}