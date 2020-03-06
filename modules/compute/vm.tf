# Create a Windows 10 Pro VM

# Create a Resource Group

resource "azurerm_resource_group" "rg" {
    name                              =   var.rgName
    location                          =   var.location
    tags   =    {
        environment                   =   var.tags
    }
}

# Create a Vnet

resource "azurerm_virtual_network" "vnet" {
    name                              =   var.vnetName
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    address_space                     =   var.vnetCIDR

    tags    =   {
        environment                   =   var.tags
    }
}

# Create a Subnet

resource "azurerm_subnet" "main" {
    name                              =   var.subnetName
    virtual_network_name              =   azurerm_virtual_network.vnet.name
    resource_group_name               =   azurerm_resource_group.rg.name
    address_prefix                    =   var.subnetCIDR   
}

# Create a Network Security Group

resource "azurerm_network_security_group" "nsg" {
    name                              =   var.nsgName
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    
    tags   =   {
        environment                   =   var.tags
     }
}

# Subnet-NSG Association

resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
    subnet_id                         =    azurerm_subnet.main.id
    network_security_group_id         =    azurerm_network_security_group.nsg.id
}

# Create a Public IP

resource "azurerm_public_ip" "pubIP" {
    name                              =   var.publicIpName
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    allocation_method                 =   var.pubIpAllocationMethod
    
    tags    =   {
        environment                   =   var.tags
    }
}

# Create a Network Interface

resource "azurerm_network_interface" "nic" {
    name                              =   var.nicName
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location

    ip_configuration                  {
        name                          =  "NicConfig"
        subnet_id                     =  azurerm_subnet.main.id
        private_ip_address_allocation =  var.private_ip_address_allocation
        public_ip_address_id          =  azurerm_public_ip.pubIP.id
    }
}

# Create a Vritual Machine

resource "azurerm_windows_virtual_machine" "vm" {
    name                              =   var.vmName
    resource_group_name               =   azurerm_resource_group.rg.name
    location                          =   azurerm_resource_group.rg.location
    network_interface_ids             =   [azurerm_network_interface.nic.id]
    size                              =   var.vmSize
    computer_name                     =   var.computer_name
    admin_username                    =   var.admin_username
    admin_password                    =   var.admin_password
    
    os_disk  {
        name                          =   var.os_disk_name
        caching                       =   var.os_disk_caching
        storage_account_type          =   var.os_disk_storage_account_type
        disk_size_gb                  =   var.os_disk_size_gb
    }

    source_image_reference {
        publisher                     =   var.publisher
        offer                         =   var.offer
        sku                           =   var.sku
        version                       =   var.vm_image_version
    }

    tags    =   {
        environment                   =   var.tags
    }
}

