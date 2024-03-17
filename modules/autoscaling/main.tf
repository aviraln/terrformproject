resource "aws_autoscaling_group" "my_asg" {
  name                      = "asg"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  vpc_zone_identifier = [var.subid1,var.subid]

  launch_template {
   id = var.id 
  }
}

