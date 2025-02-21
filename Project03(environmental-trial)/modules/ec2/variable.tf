variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}