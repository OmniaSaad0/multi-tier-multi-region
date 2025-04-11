resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "public-rt"
    }
  
}

resource "aws_route_table" "private_rt_az1" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw1.id
    }
    tags = {
        Name = "private-rt-az1"
    }
}

resource "aws_route_table" "private_rt_az2" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw2.id
    }
    tags = {
        Name = "private-rt-az2"
    }
}

