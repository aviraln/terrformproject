resource "aws_route_table" "my_pubrt" {
    vpc_id = var.vpcid

    tags = {
        Name = var.name
    }
}