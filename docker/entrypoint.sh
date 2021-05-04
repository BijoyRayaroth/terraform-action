#!/bin/sh 

echo "hello from terraform action"


git config --global user.email "bijoy.rayaroth@philips.com"
git config --global user.name "BijoyRayaroth"

git config --global credential.helper store

echo “https://BijoyRayaroth:${GIT_TOKEN}@github.com“ > ~/.git-credentials 

cat ~/.git-credentials

curl --header "Authorization: token ${GIT_TOKEN}" https://github.com/BijoyRayaroth/terraform-action.git 

git clone https://BijoyRayaroth:${INPUT_PAT}@github.com/BijoyRayaroth/terraform-action.git --branch=main main


#cd terraform-action

cd main

git remote set-url origin https://BijoyRayaroth:${INPUT_PAT}@github.com/BijoyRayaroth/terraform-action.git

cd docker

touch testfile.txt

#terraform init
#echo "Terraform init"
#terraform plan -var="nutanix-userName=${INPUT_USERNAME}" -var="nutanix-password=${INPUT_PASSWORD}" -out="terraformPlan"



#cat .git/config

git status
git add .
echo "After Add"
git status
git commit -m "adding Plan file"
echo "After Commit"
git status
echo "Pushing Terraform Plan file"
git push origin main
