data "aws_vpc" "main" {
  cidr_block = "172.2.0.0/16"
  
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.main.id
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = "${data.aws_vpc.main.id}"
  cidr_block = "172.2.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id}"
  cidr_block = "172.2.0.0/24"

  tags = {
    Name = "Main"
  }
}