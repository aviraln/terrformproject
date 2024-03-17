output "vpcid" {
  value = aws_vpc.my_vpc.id
}

output "default_rt" {
  value = aws_vpc.my_vpc.main_route_table_id
}