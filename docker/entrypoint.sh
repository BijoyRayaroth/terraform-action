#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git clone https://${GIT_TOKEN}@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-userName=${INPUT_USERNAME}" -var="nutanix-password=${NUTANIX_PASSWORD}" -out="terraformPlan"

git status
git add terraformPlan
echo "After Add"
git status
git commit -m "adding Plan file"
echo "After Commit"
git status
echo "Pushing Terraform Plan file"
git push origin HEAD:master
