data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_default_subnet" "main" {
  availability_zone = var.region
  tags = {
    Name = "Main"
  }
}