resource "aws_route" "my_pubroute" {
    route_table_id = var.rtid 
    destination_cidr_block = var.dest_cdir
    gateway_id = var.igw
    
        
}

