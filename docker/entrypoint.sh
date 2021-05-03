#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git clone https://${GIT_TOKEN}@github.com/BijoyRayaroth/terraform-action.git


git remote set-url upstream https://${GIT_TOKEN}:x-oauth-basic@github.com/BijoyRayaroth/terraform-action.git
git remote set-url origin https://${GIT_TOKEN}:x-oauth-basic@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-password=${NUTANIX_PASSWORD}" -var="nutanix-userName=${INPUT_USERNAME}" -out="terraformPlan"

git status
git add terraformPlan
git commit -m "adding Plan file"
git status
echo "Pushing Terraform Plan file"
git push origin master
