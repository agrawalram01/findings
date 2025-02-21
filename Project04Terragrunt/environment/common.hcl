#for storing state
#remote_state { 
#      bucket = "example" #should be unique 
#      key = "tutorial/terraform.tfvars"
#      dynamodb_table = "example" #name of table with partition Key is Lock_ID
#      region = var.region
      
#    }

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket = "example" #should be unique 
    key            = "${path_relative_to_include()}/terraform.tfstate" #path relative to include parameter will look for tfvars file in same directory as include.
    dynamodb_table = "example" #name of table with partition Key is Lock_ID
    region         = "us-east-1"
    encrypt        = true
  }
}
EOF
}