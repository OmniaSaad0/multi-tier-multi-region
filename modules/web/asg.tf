resource "aws_autoscaling_group" "web_asg" {
  name                = "web_asg"
  vpc_zone_identifier = [var.web_subnet1, var.web_subnet2]
  min_size            = 2
  max_size            = 4

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_tg.arn]
}

resource "aws_autoscaling_policy" "web_scaling_policy" {
  name                   = "web_cpu_scaling"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}
