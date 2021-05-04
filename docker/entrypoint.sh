#!/bin/sh 

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git clone https://BijoyRayaroth:${INPUT_PAT}@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

touch testfile.txt

#terraform init
#echo "Terraform init"
#terraform plan -var="nutanix-userName=${INPUT_USERNAME}" -var="nutanix-password=${INPUT_PASSWORD}" -out="terraformPlan"


git status
git add .
echo "After Add"
git status
git commit -m "adding Plan file"
echo "After Commit"
git status
echo "Pushing Terraform Plan file"
git push origin main
