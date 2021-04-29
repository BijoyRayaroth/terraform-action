#!/bin/sh -l

echo "hello from terraform action"

cp /main.tf .
cp /Variables.tf .

terraform init
echo "Terraform init"
terraform validate


