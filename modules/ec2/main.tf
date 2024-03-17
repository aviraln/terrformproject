resource "aws_instance" "my_ec2" {
  ami = var.amiid
  instance_type = var.instype 
  subnet_id = var.subid
  vpc_security_group_ids = [var.sg]
  key_name = var.keyname
  associate_public_ip_address = var.pubipass
  tags = {
    Name= var.name
  }
}

