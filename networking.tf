resource "aws_vpc" "main" {
  default          = true
  instance_tenancy = "default"
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "10.2.0.0/24"

  tags = {
    Name = "Main"
  }
}