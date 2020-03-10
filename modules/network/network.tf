# Network resources

# Resource Group

data "azurerm_resource_group" "rg" {
    name                        =       var.rgName
}

# Virtual Network

resource "azurerm_virtual_network" "vnet" {
    name                        =       var.vnetName
    resource_group_name         =       data.azurerm_resource_group.rg.name
    location                    =       data.azurerm_resource_group.rg.location
    address_space               =       [var.vnetCIDR] 
    tags                        =       var.tags
}

# Subnet

resource "azurerm_subnet" "core" {
    name                        =       var.subnetName
    virtual_network_name        =       azurerm_virtual_network.vnet.name
    address_prefix              =       var.subnetCIDR
    resource_group_name         =       data.azurerm_resource_group.rg.name
}

# Network Security Group

resource "azurerm_network_security_group" "nsg" {
    name                        =       var.nsgName
    resource_group_name         =       data.azurerm_resource_group.rg.name
    location                    =       data.azurerm_resource_group.rg.location
    tags                        =       var.tags
}

# Subnet-NSG Association

resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
    subnet_id                   =       azurerm_subnet.core.id
    network_security_group_id   =       azurerm_network_security_group.nsg.id
}
