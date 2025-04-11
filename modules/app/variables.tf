variable "aws_region" {
    type        = string
    description = "AWS region"
}

variable "vpc_id" {
    type        = string
    description = "VPC ID"
}

variable "web_ec2_sg" {
    type        = string
    description = "Security group ID for web EC2 instances"
}

variable "app_subnet1" {
    type        = string
    description = "Subnet ID for app instances in region 1"
}

variable "app_subnet2" {
    type        = string
    description = "Subnet ID for app instances in region 2"
}

variable "ec2_ssm_role" {
    type        = string
    description = "IAM role for EC2 instances to access SSM"
}

variable "app_ami" {
    type        = string
    description = "AMI ID for app instances"
}
