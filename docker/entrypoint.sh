#!/bin/sh -l

echo "hello from terraform action"

git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

curl -H 'Authorization: token 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' https://github.com/BijoyRayaroth/terraform-action.git 

git clone https://BijoyRayaroth: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@github.com/BijoyRayaroth/terraform-action.git --branch=main main

cd main

git remote set-url origin https://BijoyRayaroth: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@github.com/BijoyRayaroth/terraform-action.git

cd docker

terraform init
echo "Terraform init"
terraform plan -var="nutanix-userName=${INPUT_USERNAME}" -var="nutanix-password=${NUTANIX_PASSWORD}" -out="terraformPlan"

cd ..

git status
git add docker/terraformPlan
echo "After Add"
git status
git commit -m "adding Plan file"
echo "After Commit"
git status
echo "Pushing Terraform Plan file"
git push origin main
