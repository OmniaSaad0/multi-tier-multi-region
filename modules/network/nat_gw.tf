resource "aws_nat_gateway" "natgw1" {
  allocation_id = aws_eip.nat_eip1.id
  subnet_id     = aws_subnet.public_subnet1.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "nat-gw1"
  }
  
}

resource "aws_nat_gateway" "natgw2" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id     = aws_subnet.public_subnet2.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "nat-gw2"
  }
  
}