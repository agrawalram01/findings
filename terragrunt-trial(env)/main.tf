#provider "aws" {
#  region = var.aws_region
#}


module "ec2" {
  source        = "./modules/ec2"
  environment   = var.environment
  instance_name = var.environment == "dev" ? var.dev_instance_name : var.prod_instance_name
  ami_id        = var.environment == "dev" ? var.dev_ami_id : var.prod_ami_id
  instance_type = var.environment == "dev" ? var.dev_instance_type : var.prod_instance_type
}