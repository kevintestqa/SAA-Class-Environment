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
    bucket = "terraform-cloudfront-12925"
    key    = "121325/terraform-cloudfront/terraform.tfstate" //File path and name
    region = "us-west-1"
  }
}


provider "aws" {
    region = "us-west-1"
}