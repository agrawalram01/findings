# environments/dev/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  env_vars = yamldecode(file("${get_terragrunt_dir()}/env.yaml"))
}

inputs = merge(
  local.env_vars,
  {
    environment = "dev"
    vpc_cidr    = "10.0.0.0/16"
    tags = {
      Environment = "dev"
      Project     = "my-dev-project"
    }
  }
)