
variable "rgName" {
    default     =   "Dev-RG"
}

variable "location" {
    default     =   "East US"
}

variable "saName" {
    default     =   "vamsitfbackend2020"
}

variable "account_tier" {
    default     =   "Standard"
}

variable "account_replication_type" {
    default     =   "LRS"
}

variable "tags" {
    type    =   "map"
    default = {
        "Environment"  = "Development"
        "DeployedWith" = "Terraform"
        "Use"          = "Terraform Backend"
    }
}

variable "scName" {
    default             =   "tfbackend"
}

variable "container_access_type" {
    default             =   "private"
}