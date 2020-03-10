
variable "rgName" {}
variable "vnetName" {}
variable "vnetCIDR" {}
variable "subnetName" {}
variable "subnetCIDR" {}
variable "nsgName" {}

variable "tags" {
    description     =   "Resource Tags"
    type            =   "map"
    default         =   {
        "Environment"   =   "Development"
        "Purpose"       =   "Azure DevOps"
    }
}