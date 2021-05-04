#!/bin/sh 

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git clone https://BijoyRayaroth:${INPUT_PAT}@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/create-vm/docker

DepID=`tr -dc a-z </dev/urandom | head -c 6`
mkdir Deployments/$DepID

terraform init
echo "Terraform init"
#TODO- Enable When running on PGN hosted agent
#terraform apply -var="nutanix-userName=${INPUT_USERNAME}" -var="nutanix-password=${INPUT_PASSWORD}" -var="vm-count=1" -var="vm-name-prefix=Sr4-$DepID" -auto-approve
touch terraform.tfstate
touch .terraform.lock.hcl


mv terraform.tfstate ../../Deployments/$DepID
mv .terraform.lock.hcl ../../Deployments/$DepID

cd ../../Deployments/$DepID

git status
git add .
echo "After Add"
git status
git commit -m "adding state file"
echo "After Commit"
git status
echo "Pushing  state file"
git push origin main
