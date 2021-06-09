#!/bin/bash

# Set environment variables
group_name=example2-rg 
vm_name=example2-vm

echo "{ \"script\": \"$(cat script.sh | base64 -w0)\" }" >
script_base64.json

#Create virtual group 
az group create -n ${group_name}

#create virtual machine 
az vm create --n ${vm_name} --image UbuntuLTS -g ${group_name} --resource-group example-rg --size Standard_B1ms --admin-user plartey --ssh-key-value ~/.ssh/id_rsa.pub

#Add extension
az vm extension set --name customscript --resource-group ${group_name} --vm name ${vm_name} --publisher Microsoft.Azure. Extensions --protected-settings ./script_base64.json

# Open port 5000
az vm open-port -n ${vm_name} -g ${group_name} --port 5000


