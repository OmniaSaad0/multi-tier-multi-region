output "web_ec2_sg" {
  value = aws_security_group.web_ec2_sg.id
}

output "web_url" {
  description = "Public DNS name of the load balancer"
  value       = aws_lb.web_lb.dns_name
}
