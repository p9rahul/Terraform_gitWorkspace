
#Tasks

1) ssh-key -> key name
assign this key to aws instance

2)create a security group 
assign that group to instance 

3) nginx install 
/var/www/html/1.html -> hello rahul using terraform
============================
Steps -1 
go to key-pair -> generate key and download 
here private key will be downloaded and public key will be store in AWS
-create a key pair in working local directory
$ssh-keygen -t rsa 
location - ./id_rsa ->enter then 2 file will be created 
- pass thid id_rsa.pub to code through public_key in resource "aws_key_pair" "key-tf"

now - How to Assign Key to EC2 Instance in Terraform
aws instance - add  key_name      = aws_key_pair.key-tf.key_name
============================
Step-2 
35.Create a Security Group in AWS Using Terraform
ingress - incoming 
egress - outgoing 
-search aws_security_group on provider portal
make changes in security group and assign 5 rules 

36. Dynamic Block in Terraform
problem - code complexity
optimize - solution create dynamic block

37. Assign a Security to EC2 Instance using Terraform
add egress fro outbound 
execute and verify instance - securitygroup - key pair
ssh -i id_rsa ubuntu@34.224.23.56
============================
Step 3-nginx install 

39. Terraform Taint Command
- suppose we have to add a port in security group then add a new commands 
like ports         = [22, 80, 443, 3306, 27017,1080]
-now perform apply -> so this ports will be added in same security group , new security group will not be created 
-But some time some ports are taint/damaged and wanted to re-create 
- run this $terraform taint aws_security_group.security_group_terraform
- taint is not recommended alternate -> 

40. AWS userData using terraform (Installing NGINX )
scenario - create one VM instance and execute some script to install nginx 
AWS - user data (launch instance -> see in advance details -> write script here manually)
Azure - custom data
GCP - meta data

-Terraform uses for infra creation but should not use for configuration management (after fail it will not notify us)
- we can deploy application using terraform but fail will not be notify

- we can achieve same using terraform provisinor and user data 

41. File Provisioner
-terraform doesn’t recommend to use this Provisioner but still we can achieve multiple things 
- use as a last options
- example - create one shell script file run the modify run -> it will not execute because idem-potency doesn't maintain
Q) copy a file from local to AWS instance/VM?
- 3 types 1.file 2. local-exec 3. remote exec
- now write code in instance, file type 
- if provisioner fails then resources will be created but file will not be copy
- check in tfstate file -> status - tainted

42. Connection File Provisioner
-move file from local to VM

43. Local-Exec Provisioner
-Provisioner runs when resource created 
- use for execute commands in local machine where terrform binary exist 
- use case1- use to store all created resources info in a file in that machine /tmp/file1.txt
-uer case2- hit any job using command line the use this
- run ansible playbook once resource created 
-run python cmds

44. When in provisioners (Local-Exec)
use case - once instance created install sql and move some dumps on VM
- when destroy -> then keep data back somewhere(S3)

45. Remote-exec Provisioner
- run inside the created resource

46. Datasource in Terraform
- cloud providers always update image_id, instance_type so if we hard code then problem may occur
issue coming

48. Terraform Configurations
- suppose we have a team of 5 members , and you may have some different version from other
- create one terraform.tf file
- write version for terraform and aws

49. Terraform Graph
- what ever configuration is in stored , it will be display in graph form
$terraform graph | dot -Tsvg > graph.svg
$terraform graph | dot -Tpdf > graph.pdf
-for windows install Graphviz then set path

50. Terraform Workspace
problem statement - suppose we have 3 tfvars files for QA,staging,prod and we have executed apply with QA so
now tfstate will contain data releated to QA , state is maintain. now in case of staging and prod same data will be exeuted. 
solution - workspace
$terraform workspace list
create $terraform workspace new dev 
$terraform workspace show
$terraform apply --auto-approve --var-file dev-terraform.tfvars   (so tfstate file store here and maintain )unquiness 
- how to swtch 
$terraform workspace select dev
$terraform workspace --help
-can't delete same workspace like if you are in dev and wanted to delete then error will come


52. Terraform Module
Problem statement - suppose we want to create an infra with 1 VPC, 4 subnets, inside subnet 3 instance with different size, one security group and ssh key attached?
Solution- write a terrform code and resue this again & again
-Here create a infra with 1 instance with 1 key pair?
-root modules , child modules(any folder created inside root like here modules) 
- we can get ready made modules on registry.terraform.io
here
- project awsDataSources
- add modules folders
- terraform init and see inside .terraform
Q) now we have to use a different aws ami name/instance type in our run time code for different aws account?

55. Terraform Backends - Terraform s3 backend
-as we know terraform maintains the state in tfstate file
-but this file should not push to git , security reason
-other team members may have diffrent credential
- terraform provids central remote location where we can maintain tfstate file 
-storing machanism like S3,git,azure check on site
-tfstate file will be created on s3
task- till now tfstate file is in default workspace
-create 2 new workspace like test and dev
-switch default to test/dev , execute terraform plan &apply, so how tfstate file will be created?
answer- a new env folder will be created and inside that tfstate file will be there

56. Terraform Migrate Backend
Q) migrate tfstate file from s3 to local?
- terraform init -migrate-state

57. Remote Backend State Locking using S3 and DynamoDB
- let's consider 2 person executed apply cmds same time then what will happend?
- locking machanism 
- aws - dynamoDb service (inside this create entry)
- go inside the table 
-configure with terraform  (terraform - backend block)






