terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  region = var.region
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  instance_name = var.instance_name
}

