terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region1
  alias  = "primary_region"
}

provider "aws" {
  region = var.region2
  alias  = "secondary_region"
}
