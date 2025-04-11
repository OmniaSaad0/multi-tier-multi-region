#security group for aurora cluster
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow postgres traffic from app_ec2 instances"
  vpc_id      = var.vpc_id
  tags = {
    Name = "db_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db_sg_ingress_rule" {
  security_group_id            = aws_security_group.db_sg.id
  referenced_security_group_id = var.app_ec2_sg
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "db_sg_egress_rule" {
  security_group_id = aws_security_group.db_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" #semantically equivalent to all ports
}

#db subnet group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [var.db_subnet1, var.db_subnet2]
  tags = {
    Name = "db_subnet_group"
  }
}