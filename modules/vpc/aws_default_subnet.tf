resource "aws_default_subnet" "default_1" {
  availability_zone = var.aws_availability_zones.names[0]
}

resource "aws_default_subnet" "default_2" {
  availability_zone = var.aws_availability_zones.names[1]
}
