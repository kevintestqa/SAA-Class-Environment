terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.18.0"
    }
  }
}

//Changes the way the state file is stored
terraform {
  backend "s3" {
    bucket = "terraform-tuesday-1125"
    key    = "113025/terraformSunday/terraform.tfstate" //File path and name
    region = "us-west-1"
  }
}


provider "aws" {
    region = "us-west-1"
}