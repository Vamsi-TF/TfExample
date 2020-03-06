# TfExample

Create a Windows 10 VM in Azure with Terraform

--> Set Service Principal variables as Environment variables

                                            Create a New Windows VM

--> Run Terraform Plan with this command 

terraform plan -var "vmName=VM1" -var "nicName=NIC1" -var "publicIpName=vm-ip1" -var "computer_name=Windows10" -var "os_disk_name=disk1" -var "admin_password=Password123" -out="vm1.tfplan"

--> Run Terraform Apply with

terraform apply -auto-approve vm.tfplan

                                            Create a Second Windows VM

--> If you want to create another VM without destroying existing VM, 

Rename the terraform.tfstate file to "vm1.tfstate"

--> Run Terraform Plan for VM2

terraform plan -var "vmName=VM2" -var "nicName=NIC2" -var "publicIpName=vm-ip2" -var "computer_name=Windows10pro" -var "os_disk_name=disk2" -var "admin_password=Password123" -out="vm2.tfplan"

--> Run Terraform Apply with

terraform apply -auto-approve vm2.tfplan

                                          Destroy the first VM related resources

--> Rename the current terraform.tfstate to "vm2.tfstate"

--> Run Terraform Plan for VM1 Destroy

terraform plan -destroy -var "vmName=VM1" -var "nicName=NIC1" -var "publicIpName=vm-ip1" -var "computer_name=Windows10" -var "os_disk_name=disk1" -var "admin_password=Password123" -out="destroyvm1.tfplan"


--> Run Terraform Apply with

terraform apply -auto-approve destroyvm1.tfplan
