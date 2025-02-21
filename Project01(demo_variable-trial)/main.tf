provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source        = "./module/ec2_instance" #value contains path of module if in git repo provide complete path
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
}

module "s3" {
  source      = "./module/s3"
  bucket_name = var.bucket_name
}

module "vpc" {
  source                    = "./module/vpc"
  vpc_name                  = var.vpc_name
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  public_subnet_name        = var.public_subnet_name
  private_subnet_cidr_block = var.private_subnet_cidr_block
  private_subnet_name       = var.private_subnet_name
  public_subnet_az          = var.public_subnet_az
  private_subnet_az         = var.private_subnet_az
}