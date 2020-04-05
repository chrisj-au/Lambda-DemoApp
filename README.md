# Lambda-DemoApp
Jenkins, Terraform &amp; Python example Lambda application

# Overview
This application would usually span across multiple Jenkins pipelines.



# Getting Started

## Requirements
- IAM Role with permissions to run Terraform
- S3 Bucket to store TF state
    - bucket policy permissions
- terraform/env/{workspace}/tfsettings.yaml configured as per your requirements


# Terraform

The Terraform provided in this repo allows for 2 environments controlled by workspaces.

```
terraform workspace select production
terraform plan -var-file=backend-config.tfvars
```