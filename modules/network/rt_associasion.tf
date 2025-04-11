resource "aws_route_table_association" "public_rta1" {
    subnet_id      = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rta2" {
    subnet_id      = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "web_rta1" {
    subnet_id      = aws_subnet.web_subnet1.id
    route_table_id = aws_route_table.private_rt_az1.id
  
}

resource "aws_route_table_association" "web_rta2" {
    subnet_id      = aws_subnet.web_subnet2.id
    route_table_id = aws_route_table.private_rt_az2.id
  
}

resource "aws_route_table_association" "app_rta1" {
    subnet_id      = aws_subnet.app_subnet1.id
    route_table_id = aws_route_table.private_rt_az1.id
  
}

resource "aws_route_table_association" "app_rta2" {
    subnet_id      = aws_subnet.app_subnet2.id
    route_table_id = aws_route_table.private_rt_az2.id 
  
}

resource "aws_route_table_association" "db_rta1" {
    subnet_id      = aws_subnet.db_subnet1.id
    route_table_id = aws_route_table.private_rt_az1.id
  
}

resource "aws_route_table_association" "db_rta2" {
    subnet_id      = aws_subnet.db_subnet2.id
    route_table_id = aws_route_table.private_rt_az2.id 
  
}
