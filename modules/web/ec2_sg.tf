resource "aws_security_group" "web_ec2_sg" {
  name        = "web_ec2_sg"
  description = "Allow HTTP from Load Balancer"
  vpc_id      = var.vpc_id
    tags = {
    Name = "web_ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_http" {
  security_group_id            = aws_security_group.web_ec2_sg.id
  referenced_security_group_id = aws_security_group.web_lb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "web_ec2_egress" {
  security_group_id = aws_security_group.web_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
