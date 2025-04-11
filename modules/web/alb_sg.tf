resource "aws_security_group" "web_lb_sg" {
  name        = "web_lb_sg"
  description = "Allow HTTP"
  vpc_id      = var.vpc_id
  tags = {
    Name = "web_lb_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_lb_http" {
  security_group_id = aws_security_group.web_lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "web_lb_egress" {
  security_group_id = aws_security_group.web_lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
