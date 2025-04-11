variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
}

variable "region" {
  type = string
  description = "AWS region to deploy the VPC"
}

variable "web" {
  type = list(string)
  description = "List of CIDR blocks for web subnets"
}
variable "app" {
  type = list(string)
  description = "List of CIDR blocks for app subnets"
}

variable "db" {
  type = list(string)
  description = "List of CIDR blocks for db subnets"
}
variable "public_subnets" {
  type = list(string)
  description = "List of CIDR blocks for public subnets"
}

