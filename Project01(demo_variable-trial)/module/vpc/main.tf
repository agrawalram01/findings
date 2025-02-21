resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

# Create private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_az

  tags = {
    Name = var.private_subnet_name
  }
}