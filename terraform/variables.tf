variable "name" {
    description = "Used to name resources created"
}

variable "accountId" {
    description = "AWS Account Id"
}

variable "lambda_zip" {
    description = "Lambda source code zip"
}

variable "lambda_handler" {
    description = "Lambda event handler"
}

variable "env" {
    
}