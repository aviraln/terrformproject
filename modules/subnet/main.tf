resource "aws_subnet" "my_pub_subnet" {
  vpc_id = var.vpcid
  cidr_block = var.cidr
  availability_zone = var.avazone 
  tags = {
            Name = var.name
        }
}

