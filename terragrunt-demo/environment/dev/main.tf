module "ec2" {
  source        = "../../modules/ec2"
  environment   = var.environment
  instance_name = var.dev_instance_name
  ami_id        = var.dev_ami_id
  instance_type = var.dev_instance_type
}