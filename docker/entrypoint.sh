#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

curl -H 'Authorization: token ${GIT_TOKEN}' https://github.com/BijoyRayaroth/terraform-action.git 

git clone https://BijoyRayaroth:${GIT_TOKEN}@github.com/BijoyRayaroth/terraform-action.git --branch=main main

cd main

git remote set-url origin https://BijoyRayaroth:${GIT_TOKEN}@github.com/BijoyRayaroth/terraform-action.git

cd docker

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
git push https://${GIT_USERNAME}:${GIT_PASSWORD}@terraform-action.biz/file.git --all
