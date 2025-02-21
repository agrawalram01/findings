variable "vpc_cidr" {
  default = "10.100.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.100.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.100.3.0/24"
}

variable "region" {
  default = "us-west-2"
}