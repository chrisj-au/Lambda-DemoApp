# Lambda-DemoApp
Jenkins, Terraform & Python example Lambda application

# Overview
This application would usually span across multiple Jenkins pipelines.

Bridge the gap between application and infrastructure configuration


# Getting Started

## Requirements

- S3 bucket & bucket policy to store TF state 
- Application configuration 
- (optional) Terraform environment configuration
- (optional) IAM user to run Terraform via the console.

### Create S3 bucket & bucket policy

An example s3 policy is available under configuration/s3_policy_example.json.  If running Terraform via the console an IAM user will need to be added to the principal list within the policy.

```
aws s3api create-bucket --bucket {app_name} --region {region} --create-bucket-configuration LocationConstraint={region}
aws s3api put-bucket-policy --bucket lambda-demoapp --policy file://configuration/s3_policy.json
```

### Application Requirements

Create a json file and supply it's location when invoking Terraform (see Terraform section) or manually provide variables via the plan/apply commands.  configuration/app_config.json supplied with application settings (see _example.json)

### Terraform Environment

A Dev & Prod environment has already been created, these can be updated to suit your requirements.  Additional environments can be created using the path: terraform/env/{workspace}/tfsettings.yaml.  To ensure this is available for use a workspace must also be created (this is automatic if using Jenkins).  If no workspaces are created or an environment is created without a workspace then the '_default.yaml' settings will be used.

# Terraform

Workspaces underpin the configuration of the Terraform files.

## Configuration

Configuration has been split into 2 sections, Environment/Workspaces which is maintained by cloud engineers and application configuration which is used by developers as input into the naming of solutions etc.  Any configuration can be exposed to the developers however limiting inputs allows for greater enforcement of company policies.

### Environments / Workspaces
To declare an environment configuration create a tfsettings.yaml file within the 'env' folder using the path terraform/env/{workspace_name}/tfsettings.yaml where {workspace_name} is the workspace used for the environment.

### Application Configuration

Configuration has been extracted out of TF into yaml files.





Zip file for lambda must be local to where Terraform is being executed.

## Usage

```
terraform workspace select production
terraform init -backend-config="bucket={app_name}" -backend-config="region={region}" -backend-config="key=tfstate\terraform.tfstate"
terraform plan -var-file="../configuration/app_config.json"
```


# Jenkins

