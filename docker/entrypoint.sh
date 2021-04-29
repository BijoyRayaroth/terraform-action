#!/bin/sh -l

echo "hello from terraform action"

Version = terraform -version
echo "Terraform version-${Version}"


