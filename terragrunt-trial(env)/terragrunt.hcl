# Understand as toy example: This is like the main rule book for all your toys
#remote_state {
#  backend = "s3" # We keep track of toys in a special box
#  config = {
#    bucket         = "my-terraform-state-${get_env("ENV", "dev")}" #box name
#    key            = "${path_relative_to_include()}/terraform.tfstate" #where in the box
#    region         = "us-west-2" #which room it is in
#    encrypt        = true
#    dynamodb_table = "terraform-locks"
#  }
#}

# Load common variables
locals {
  common_vars = yamldecode(file("${get_parent_terragrunt_dir()}/common.yaml"))
}

# Generate provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.common_vars.aws_region}"
}
EOF
}

# Common inputs for all environments
inputs = merge(
  local.common_vars,
  {
    project = "my-project"
    region  = "us-west-2"
  }
)