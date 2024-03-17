resource "aws_lb_target_group" "target_group" {
  name = var.name
  port = var.port
  protocol = var.protocol
  target_type = var.tgtype
   vpc_id = var.vpcid

   target_health_state {
    enable_unhealthy_connection_termination = false
  }
}

