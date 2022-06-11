provider "aws" {
  region     = "us-east-1"
  access_key = file("E:\\Rahul\\Terraform\\access_key.txt")
  secret_key = file("E:\\Rahul\\Terraform\\secret_key.txt")
}