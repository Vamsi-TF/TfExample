
variable "rgName" {
    default         =       "Windows-RG"
}

variable "location" {
    default         =       "East US"
}

variable "tags" {
    default         =       "Development"
}

variable "vnetName" {
    default         =       "Main-Vnet"
}

variable "vnetCIDR" {
    default         =       ["10.0.0.0/16"]
}

variable "subnetName" {
    default         =       "Core-Subnet"
}

variable "subnetCIDR" {
    default         =       "10.0.1.0/24"
}

variable "nsgName" {
    default         =       "Dev-NSG"
}

variable "publicIpName" {}

variable "pubIpAllocationMethod" {
    default         =       "Static"
}

variable "nicName" {}

variable "private_ip_address_allocation" {
    default         =       "Static"
}

variable "vmName" {}

variable "vmSize" {
    default         =       "Standard_D2_v2"
}

variable "computer_name" {}

variable "admin_username" {
    default         =       "Administrator"
}

variable "admin_password" {}

variable "os_disk_name" {}

variable "os_disk_caching" {
    default         =       "ReadWrite"
}

variable "os_disk_storage_account_type" {
    default         =       "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
    default         =       128
}

variable "publisher" {
    default         =       "MicrosoftWindowsDesktop"
}

variable "offer" {
    default         =       "Windows-10"
}

variable "sku" {
    default         =       "rs5-pro"
}

variable "vm_image_version" {
    default         =       "latest"
}
