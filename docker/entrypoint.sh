#!/bin/sh -l

echo "hello from terraform action"

yourfilenames=`ls .`
for eachfile in $yourfilenames
do
   echo $eachfile
done

terraform init
echo "Terraform init"
terraform validate


