resource "aws_autoscaling_group" "app_asg" {
  name                = "app_asg"
  vpc_zone_identifier = [var.app_subnet1, var.app_subnet2]
  min_size            = 2
  max_size            = 4
  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.app_lb_tg.arn]
}

resource "aws_autoscaling_policy" "app_cpu_target_tracking_asp" {
  name                   = "app_cpu_target_tracking_asp"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}
