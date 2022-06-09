terraform {
  required_version = "v1.2.2" #terraform version constraint    
  #   version = ">= 1.2.0, < 2.0.0"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }



}