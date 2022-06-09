resource "aws_key_pair" "key-tf" {
  key_name = "key_terraform"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPJeDnNbAA1pdx6/DSQfBG1OBfSK+O/UMmA7hf+pDM3ue3AiSdflrBsKIfcCWG/VQxl4M+yKJNVJjn+ObczMk0h0xAPlHspnltEP9jzLq7XNrcFwMbVX7Rvw7+Op610E7dRaQp1LBv8guE8EOgGnm+Wsu6ViHoQnbYGyTc9Q4luAQ8iVL+pMsON5wqP/hIOfhIgF/AHstovGSjDHj8N//SbieXXF3+IwJuKYFJePHGeC/fH5ZjS9zeuBYEc4RhQQ6yZcVUxhUc5U4FPBLlM/VhkQoeFkQQs0Q7OPQbaT6Ov0xnSLRZTT4BVj1FeR/GwqsdGek4QWuH6yjhWGVqKrNh plabs india@DESKTOP-KL1UER4"
  #public_key =file("${path.module/id_rsa.pub}")
  public_key = file("E:\\Rahul\\Terraform\\Terraform_GitRepos\\awsSample\\id_rsa.pub")
}

#to print on console only not other use
output "ssh-localkey" {
  value = aws_key_pair.key-tf.key_name
}