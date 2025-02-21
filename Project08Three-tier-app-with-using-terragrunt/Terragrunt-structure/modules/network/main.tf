#Reference terraform registory (URL:registory.terraform.io/providers/hashicorp/aws/latest/docs)


# 1- Provider
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
  #for below state block to work there should be s3 bucket with versioning enabled
 #   backend "s3" {
 #     bucket = "example" #should be unique 
#      key = "tutorial/terraform.tfvars"
#      dynamodb_table = "example" #name of table with partition Key is Lock_ID
#      region = var.region
#      
#    }
}

# 2- Configure the AWS Provider
provider "aws" {
  region = var.region
}

# 3- Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "VPC Tutorial"
  }
}

# 4- Create Subnet
resource "aws_subnet" "public_sb" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "us-west-2c"

  tags = {
    Name = "public-subnet01"
  }
}

resource "aws_subnet" "private_sb" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-west-2c"

  tags = {
    Name = "private-subnet01"
  }
}

# 5- Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "InternetGW"
  }
}

# 6- Create Route Table for Public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public_RT"
  }
}

#7- Create Route association
resource "aws_route_table_association" "public_rt_a" {
  subnet_id      = aws_subnet.public_sb.id
  route_table_id = aws_route_table.public_rt.id
}

# 8- Create Elatic IP for Private subnet to provide public IP for NAT Gatway to interect with Internet
resource "aws_eip" "eip_nat_gw" {
  vpc = true
}

# 9- Create NAT Gateway for Private subnet to interect with Internet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip_nat_gw.id
  subnet_id     = aws_subnet.private_sb.id

  tags = {
    Name = "gw NAT_GW01"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
} 

# 10- Create Route table for Private subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Private_RT"
  }
}

#11- Create Route association
resource "aws_route_table_association" "private_rt_a" {
  subnet_id      = aws_subnet.private_sb.id
  route_table_id = aws_route_table.private_rt.id
}