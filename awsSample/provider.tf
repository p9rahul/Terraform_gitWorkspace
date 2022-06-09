provider "aws" {
  region = "us-east-1"
  # access_key = "${var.access_key}" #IAM-users - add user - make programmatic - create group
  # secret_key = "${var.secret_key}"

  access_key = file("E:\\Rahul\\Terraform\\access_key.txt")
  secret_key = file("E:\\Rahul\\Terraform\\secret_key.txt")
}