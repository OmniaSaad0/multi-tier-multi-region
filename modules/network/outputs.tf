output "my_vpc" {
  value = aws_vpc.my-vpc.id
}

output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}

output "web_subnet1" {
  value = aws_subnet.web_subnet1.id
}

output "web_subnet2" {
  value = aws_subnet.web_subnet2.id
}

output "app_subnet1" {
  value = aws_subnet.app_subnet1.id
}

output "app_subnet2" {
  value = aws_subnet.app_subnet2.id
}

output "db_subnet1" {
  value = aws_subnet.db_subnet1.id
}

output "db_subnet2" {
  value = aws_subnet.db_subnet2.id
}
