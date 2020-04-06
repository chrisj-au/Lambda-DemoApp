variable "name" {
    type = string
}

variable "entry_method" {
    type = string
}

variable "lambda_zip" {
    type = string
}
variable "description" {
    type = string
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.name}-Lambda-Role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda" {
    depends_on    = [aws_iam_role.iam_for_lambda]
    role          = aws_iam_role.iam_for_lambda.arn
    function_name = var.name
    handler       = var.entry_method
    publish       = "false"
    description = var.description
    filename      = var.lambda_zip
    source_code_hash = filebase64sha256(var.lambda_zip)
    runtime = "python3.8"
}