resource "aws_vpc" "main" {
  cidr_block = "10.2.0.0/16"
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.main.id 
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.vpc_id
  cidr_block = "10.2.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}