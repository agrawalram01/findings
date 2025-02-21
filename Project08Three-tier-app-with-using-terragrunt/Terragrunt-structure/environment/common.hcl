#for storing state
#remote_state { 
#      bucket = "raagrawaluniqueness" #should be unique 
#      key = "${path_relative_to_include()}/terraform.tfstate"
#      dynamodb_table = "example" #name of table with partition Key is Lock_ID
#      region = var.region
      
#    }

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket = "raagrawaluniqueness" #should be unique 
    key            = "${path_relative_to_include()}/terraform.tfstate" #path relative to include parameter will look for tfvars file in same directory as include.
    dynamodb_table = "example" #name of table with partition Key is LockID
    region         = "us-east-2"
    encrypt        = true
  }
}
EOF
}