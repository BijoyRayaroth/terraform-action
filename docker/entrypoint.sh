#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@gmail.com"
git config --global user.name "BijoyRayaroth"

git clone https://github.com/BijoyRayaroth/terraform-action.git

terraform init
echo "Terraform init"
terraform plan -var="nutanix-password=${INPUT_USERNAME}" -var="nutanix-userName=${INPUT_PASSWORD}" -out="terraformPlan"

git add terraformPlan
git commit -m "adding Plan file"
git push

