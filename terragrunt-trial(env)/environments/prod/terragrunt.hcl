# environments/prod/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  env_vars = yamldecode(file("${get_terragrunt_dir()}/env.yaml"))
}

inputs = merge(
  local.env_vars,
  {
    environment = "prod"
    vpc_cidr    = "172.16.0.0/16"
    tags = {
      Environment = "prod"
      Project     = "my-prod-project"
    }
  }
)