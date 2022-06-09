# provider "aws" {
#   region = "us-east-1"
#   # access_key = "${var.access_key}" #IAM-users - add user - make programmatic - create group
#   # secret_key = "${var.secret_key}"

#   access_key = file("E:\\Rahul\\Terraform\\access_key.txt")
#   secret_key = file("E:\\Rahul\\Terraform\\secret_key.txt")
# }

# #Datasource in Terraform
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners = ["099720109477"]   # copy any image id ->ec2-> AMIs -> public image -> copy owners

# #name =ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-20220420
#    filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

#   output ami_id {
#     value = data.aws_ami.ubuntu.id
#   }