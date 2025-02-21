# environments/dev/ec2/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/s3"
}

#dependency "vpc" {
#  config_path = "../vpc"
#}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.yaml"))
}

inputs = {
  bucket_name = local.env_vars.bucket_name
}