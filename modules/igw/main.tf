resource "aws_internet_gateway" "my_igw" {
  vpc_id = var.vpcid
}