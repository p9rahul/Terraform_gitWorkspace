#35.Create a Security Group in AWS Using Terraform
#36.Dynamic Block in Terraform
resource "aws_security_group" "security_group_terraform" {
  name        = "security_group_terraform"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id

  #SSH-22, 
  #for web server HTTP -80
  # https-443
  #sql-3306
  # mongo DB- 27017
  dynamic "ingress" {
    # for_each = [22, 80, 443, 3306, 27017] # pas this from variables.tf
    for_each = var.ports
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] #allow from anywhere 
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}



#print id on console
output "security_group_Details" {
  value = aws_security_group.security_group_terraform.id
}