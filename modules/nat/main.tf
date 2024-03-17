resource "aws_nat_gateway" "mynatGateway" {
  allocation_id = var.allid
  subnet_id = var.subid
  connectivity_type = "public"
  
  tags = {
    Name = var.name
  }
}





