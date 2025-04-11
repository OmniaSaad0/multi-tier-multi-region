output "db_sg" {
  value = aws_security_group.db_sg.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}