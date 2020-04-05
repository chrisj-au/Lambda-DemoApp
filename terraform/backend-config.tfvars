variable "bucket" {
    description = "S3 bucket for TF state files"
}

variable "key" {
    description = "S3 bucket key"
    default = "terraform.tfstate"
}