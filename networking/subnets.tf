resource "aws_subnet" "private-main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.0.0/24"

  tags = {
    Name = "private-main"
  }
}

resource "aws_subnet" "public-main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.2.64.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-main"
  }
}