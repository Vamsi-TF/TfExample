
variable "rgName" {
    description     =   "Name of the resource group"
    type            =   string
    default         =   "Az-DevOps"
}

variable "vnetName" {
    description     =   "Name of the virtual network"
    type            =   string
    default         =   "Dev-Vnet"
}

variable "vnetCIDR" {
    description     =   "Vnet CIDR Range"
    type            =   string
    default         =   "10.0.0.0/16"
}

variable "subnetName" {
    description     =   "Name of the subnet"
    type            =   string
    default         =   "Dev-Subnet"
}

variable "subnetCIDR" {
    description     =   "Subnet CIDR Range"
    type            =   string
    default         =   "10.0.1.0/24"
}

variable "nsgName" {
    description     =   "Name of the network security group"
    type            =   string
    default         =   "Dev-NSG"
}

variable "tags" {
    description     =   "Resource Tags"
    type            =   map(string)
    default         =   {
        "Environment"   =   "Development"
        "Purpose"       =   "Azure DevOps"
    }
}