packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region1" {
  type = string
}

variable "region2" {
  type = string
}

source "amazon-ebs" "web_ami_region1" {
  ami_name      = "web-ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region1
  source_ami_filter {
    filters = {
      name                = "al2023-ami-*-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  name    = "build-web-ami-region1"
  sources = ["source.amazon-ebs.web_ami_region1"]
  provisioner "file" {
    source      = "./packer/web/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo mv /tmp/index.html /usr/share/nginx/html/index.html"
    ]
  }
}

source "amazon-ebs" "web_ami_region2" {
  ami_name      = "web-ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region2
  source_ami_filter {
    filters = {
      name                = "al2023-ami-*-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  name    = "build-web-ami-region2"
  sources = ["source.amazon-ebs.web_ami_region2"]
  provisioner "file" {
    source      = "./packer/web/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo mv /tmp/index.html /usr/share/nginx/html/index.html"
    ]
  }
}

source "amazon-ebs" "app_ami_region1" {
  ami_name      = "app-ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region1
  source_ami_filter {
    filters = {
      name                = "al2023-ami-*-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  name    = "build-app-ami-region1"
  sources = ["source.amazon-ebs.app_ami_region1"]
  provisioner "file" {
    source      = "./packer/app/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo mv /tmp/index.html /usr/share/nginx/html/index.html",
      "sudo yum install -y postgresql16"
    ]
  }
}

source "amazon-ebs" "app_ami_region2" {
  ami_name      = "app-ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region2
  source_ami_filter {
    filters = {
      name                = "al2023-ami-*-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  name    = "build-app-ami-region2"
  sources = ["source.amazon-ebs.app_ami_region2"]
  provisioner "file" {
    source      = "./packer/app/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo mv /tmp/index.html /usr/share/nginx/html/index.html",
      "sudo yum install -y postgresql16"
    ]
  }
}
