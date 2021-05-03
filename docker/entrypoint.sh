#!/bin/sh -l

echo "hello from terraform action"

token="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"


git config remote.origin.url 'https://${token}@github.com/BijoyRayaroth/terraform-action.git'

git clone https://github.com/BijoyRayaroth/terraform-action.git

cd terraform-action/docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-password=${INPUT_USERNAME}" -var="nutanix-userName=${INPUT_PASSWORD}" -out="terraformPlan"

git add terraformPlan
git commit -m "adding Plan file"
echo "Pushing Terraform Plan file"
git push


