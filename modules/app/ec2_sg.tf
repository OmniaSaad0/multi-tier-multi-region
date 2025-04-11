resource "aws_security_group" "app_ec2_sg" {
  name        = "app_ec2_sg"
  description = "Allow http traffic from app_lb"
  vpc_id      = var.vpc_id
  tags = {
    Name = "app_ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_ec2_sg_ingress_rule" {
  security_group_id            = aws_security_group.app_ec2_sg.id
  referenced_security_group_id = aws_security_group.app_lb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "app_ec2_sg_egress_rule" {
  security_group_id = aws_security_group.app_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
