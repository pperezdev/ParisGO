data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = "${data.aws_vpc.default_vpc.id}"
  cidr_block = "10.0.1.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}