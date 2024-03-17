resource "aws_route_table_association" "rtassociation" {
    subnet_id = var.subid
    route_table_id = var.rtid 
}