#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git config --global remote.origin.url 'https://$GIT_TOKEN@github.com/BijoyRayaroth/terraform-action.git'

git clone https://$GIT_TOKEN@github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-password=${INPUT_USERNAME}" -var="nutanix-userName=${NUTANIX_PASSWORD}" -out="terraformPlan"

git add terraformPlan
git commit -m "adding Plan file"
echo "Pushing Terraform Plan file"
git push


