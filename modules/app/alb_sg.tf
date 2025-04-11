resource "aws_security_group" "app_lb_sg" {
  name        = "app_lb_sg"
  description = "Allow http traffic from web_ec2 instances"
  vpc_id      = var.vpc_id
  tags = {
    Name = "app_lb_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_lb_sg_ingress_rule" {
  security_group_id            = aws_security_group.app_lb_sg.id
  referenced_security_group_id = var.web_ec2_sg
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "app_lb_sg_egress_rule" {
  security_group_id = aws_security_group.app_lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
