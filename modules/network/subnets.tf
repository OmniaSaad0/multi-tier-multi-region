
resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.public_subnets[0]
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-1"
    } 
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.public_subnets[1]
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-2"
    }  
}

resource "aws_subnet" "web_subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.web[0]
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = false
    tags = {
        Name = "web-subnet1"
    }  
  
}

resource "aws_subnet" "web_subnet2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.web[1]
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = false
    tags = {
        Name = "web-subnet2"
    }  
  
}

resource "aws_subnet" "app_subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.app[0]
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = false
    tags = {
        Name = "app-subnet1"
    }  
  
}

resource "aws_subnet" "app_subnet2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.app[1]
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = false
    tags = {
        Name = "app-subnet2"
    }  
  
}

resource "aws_subnet" "db_subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.db[0]
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = false
    tags = {
        Name = "db-subnet1"
    }  
  
}

resource "aws_subnet" "db_subnet2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.db[1]
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = false
    tags = {
        Name = "db-subnet2"
    }  
  
}





