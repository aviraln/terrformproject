resource "aws_network_acl_association" "naclassociation" {
  network_acl_id = var.naclid
  subnet_id = var.subid
}

