#all web server modules 

#key
resource "aws_key_pair" "key-tf" {
  key_name = var.key_name
  public_key = var.key
}

#instance
resource "aws_instance" "web" {
ami = var.image_id
instance_type=var.instance_type
key_name = aws_key_pair.key-tf.key_name
}

# Q) trick - suppose we want ot print ip address but this instance is inside the module so how to take output? 
# so create a file output.tf at module level, copy the same block in instance 
output publidIP {
  value= aws_instance.web.public_ip
}

#now want to make ami, instance_type in variable. make variable file in the module