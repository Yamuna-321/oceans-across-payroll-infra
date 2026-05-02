#!/bin/bash

echo "Starting Terraform deployment workflow..."

cd ../terraform || exit

terraform init
terraform fmt
terraform validate
terraform plan

echo "Terraform validation and planning completed successfully."
