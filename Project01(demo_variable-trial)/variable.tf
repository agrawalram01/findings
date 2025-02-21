variable "ami_id" {
  description = "AMI ID"

}

variable "region" {
  description = "region"
}

variable "instance_type" {
  description = "instance type"

}

variable "instance_name" {
  description = "instance name"
  type        = string

}

variable "vpc_name" {
  type = string

}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for public subnet"
}

variable "public_subnet_name" {
  description = "Name for public subnet"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for private subnet"

}

variable "private_subnet_name" {
  description = "Name for private subnet"

}

variable "private_subnet_az" {
  description = "Name for private subnet"

}

variable "public_subnet_az" {
  description = "Name for public subnet"

}

variable "bucket_name" {
  type    = string
}