

module "mywebserver" {
  source = "./modules/webserver"
  key = file("E:\\Rahul\\Terraform\\Terraform_gitWorkspace\\awsSample\\id_rsa.pub")

/*tfvars file is at root level so how modules will use that variables , for that declare that here
#copy paste mudule varible.tf to root varible.tf
Below block is like this
function(int a, int b)
return a+b
*/
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"

  key_name="${var.key_name}"
}

#take this blockfrom resources.tf
output publicIPValue {
  value= module.mywebserver.publidIP
}

/*
module sources we can take from below places:-

1.Local paths
2.Terraform Registry
3.GitHub
4.Bitbucket
5.Generic Git, Mercurial repositories
6.HTTP URLs
6.S3 buckets
7.GCS buckets
8.Modules in Package Sub-directories

*/