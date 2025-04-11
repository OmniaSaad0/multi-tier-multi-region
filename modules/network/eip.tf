resource "aws_eip" "nat_eip1" {
    domain = "vpc"
    depends_on = [ aws_internet_gateway.igw ]
    tags = {
        Name = "nat-eip1"
    }
}
resource "aws_eip" "nat_eip2" {
    domain = "vpc"
    depends_on = [ aws_internet_gateway.igw ]
    tags = {
        Name = "nat-eip2"
    }
}