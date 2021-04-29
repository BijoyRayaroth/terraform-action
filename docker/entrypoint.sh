#!/bin/sh -l

echo "hello from terraform action"

terraform init
echo "Terraform init"
terraform validate


