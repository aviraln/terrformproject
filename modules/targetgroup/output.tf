output "tgid" {
  value = aws_lb_target_group.target_group.id
}

output "tgarn" {
  value = aws_lb_target_group.target_group.arn
}