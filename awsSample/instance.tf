#Datasource in Terraform
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # copy any image id free one ->ec2-> AMIs -> public image -> copy owners

  #name =ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-20220420
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

#creating instance.
# EC2 instance Vm will be created without any key pair ist -> then add KP
#execute and verify instance - securitygroup - key pair
# ssh -i id_rsa ubuntu@34.224.23.56
resource "aws_instance" "web" {
  #   ami = "ami-09d56f8956ab235b3" #pass this form variables
  ami = var.image_id
  # ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.security_group_terraform.id}"] # Assign a Security to EC2 Instance using Terraform
  tags = {
    Name = "first_tf_instance"
  }
  user_data = file("E:\\Rahul\\Terraform\\Terraform_GitRepos\\awsSample\\script.sh")

  # Thid code is looking ugly and some issues may come so create shell file 
  #   user_data = <<- EOF
  # #!/bin/bash
  # sudo apt-get update
  # sudo apt-get install nginx -y
  # sudo echo "Hi rahul " >/var/www/html/home.html
  #   EOF

  # connection {
  #   type        = "ssh" #windows vinrm
  #   user        = "ubuntu"
  #   private_key = file("./id_rsa")
  #   host        = self.public_ip #see in docks attribute section public_ip
  # }

  # provisioner "file" {
  #   source      = "readme.md"
  #   destination = "/tmp/readme.md"
  #   #connect aws instance using ssh
  #   # connection {
  #   #   type        = "ssh" #windows vinrm
  #   #   user        = "ubuntu"
  #   #   private_key = file("./id_rsa")
  #   #   host        = "${self.public_ip}" #see in docks attribute section public_ip
  #   # }
  # }


  # provisioner "local-exec" {
  #   on_failure = continue
  #   command    = "echo ${self.private_ip} >> private_ips.txt"
  # }

  # provisioner "local-exec" {
  #   on_failure  = continue
  #   working_dir = "/var/"
  #   command     = "echo ${self.private_ip} >> private_ips.txt" #file will create in local machine 
  # }

  # provisioner "local-exec" {
  #   on_failure = continue
  #   interpreter = [
  #     "/usr/bin/python3", "-c"
  #   ]
  #   command = "print('Hello world')"
  # }

  # provisioner "local-exec" {
  #   on_failure = continue
  #   command    = "echo 'at Create'"
  # }

  # provisioner "local-exec" {
  #   on_failure = continue
  #   when       = destroy
  #   command    = "echo 'at delete'"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "ifconfig > /tmp/ipconfig1.output",
  #     "echo 'hello rahul' > /tmp/test.txt"
  #   ]
  # }

  # provisioner "remote-exec" {
  #   script = "script path"
  # }

}


/*dead loack conditon - aws_instance.web -> aws_instance.web always run
host = "${aws_instance.web.public_ip}"
solution 
host = "${self.public_ip}"

Q) if multiple provisioner needed, for all same connection block is required 
then move connection block outside 
*/
