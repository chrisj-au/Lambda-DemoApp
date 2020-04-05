variable "name" {
    description = "Used to name resources created"
}

variable "aws_region" {
    default = "ap-southeast-2"
    description = "AWS Region to deploy to"
}

variable "log_level" {
    desription = "Lambda & API Gateway log level"
}

variable "log_duration" {
    description = "Length of time to keep Lambda & API Gateway logs"
}