resource "aws_lb" "my_alb" {
  name = var.name
  load_balancer_type = var.lbtype
  subnets = [var.subid1,var.subid]
  security_groups = [var.sgid] 
  
}




