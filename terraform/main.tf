terraform {
    required_version = ">=0.12"
    backend "s3" {
        workspace_key_prefix = "terraform"
    }
}

provider "aws" {
  profile    = "default"
  region     = local.tfsettings.region
}

module "lambda" {
    source = "./modules/lambda"
    name = "${var.name}-${terraform.workspace}"
    lambda_zip = var.lambda_zip
    entry_method = var.lambda_handler
    description = local.tfsettings.description
}


//module "api_gateway" {
    // If a short name for the stage is provided use it, otherwise use workspace name
    //stage_name = "${local.tfsettings.shortname != "" ? local.tfsettings.shortname : terraform.workspace}"
//}