terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  key_name      = "new-key"
  monitoring    = true


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}