resource "aws_launch_template" "my_template" {
  name_prefix = var.name
  image_id = var.amiid
  instance_type = var.instype
  vpc_security_group_ids = [ var.sgid ]
}