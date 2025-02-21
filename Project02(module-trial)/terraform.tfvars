aws_region         = "us-west-2"
environment        = "dev"
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-west-2a", "us-west-2b"]
instance_name      = "web-server"
ami_id             = "ami-0c55b159cbfafe1f0"  # Replace with actual AMI ID
instance_type      = "t2.micro"
key_name           = "my-key-pair"  # Replace with actual key pair name

tags = {
  Environment = "dev"
  Terraform   = "true"
  Project     = "example"
}