provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  environment        = var.environment
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  availability_zones = var.availability_zones
  tags              = var.tags
}

module "ec2" {
  source = "./modules/ec2"

  environment    = var.environment
  instance_name  = var.instance_name
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.public_subnet_ids[0]
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  tags          = var.tags
}