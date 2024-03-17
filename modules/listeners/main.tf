resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.lbarn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = var.action
    target_group_arn = var.tgarn
  }
}


