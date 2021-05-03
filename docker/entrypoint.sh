#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git clone https://${GIT_TOKEN}@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-password=${NUTANIX_PASSWORD}" -var="nutanix-userName=${INPUT_USERNAME}" -out="terraformPlan"


git add terraformPlan
git commit -m "adding Plan file"
echo "Pushing Terraform Plan file"
git push origin master
