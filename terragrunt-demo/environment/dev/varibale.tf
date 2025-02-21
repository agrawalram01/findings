variable "environment" {
  description = "Environment name"
  type        = string
}

variable "dev_instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "dev_ami_id" {
  description = "ID of the AMI to use"
  type        = string
}

variable "dev_instance_type" {
  description = "EC2 instance type"
  type        = string
}