# environments/dev/ec2/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ec2"
}

#dependency "vpc" {
#  config_path = "../vpc"
#}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.yaml"))
}

inputs = {
  instance_type  = "t2.micro"
  ami_id         = local.env_vars.ami_id
  instance_name  = "prod-instance"
}