# Create Resource Groups

resource "azurerm_resource_group" "rg" {
    name            =       var.rgName
    location        =       var.rgLocation
    tags            =       var.tags
}

# Variables

variable "rgName" {
    description     =      "Name of the resource group"
    type            =      string
    default         =      "Az-DevOps"
}

variable "rgLocation" {
    description     =      "Location of the resource group"
    type            =      string
    default         =      "East US"
}

variable "tags" {
    description     =   "Resource Tags"
    type            =   map(string)
    default         =   {
        "Environment"   =   "Development"
        "Purpose"       =   "Azure DevOps"
    }
}