resource "aws_iam_instance_profile" "web_instance_profile" {
  name_prefix = "web_instance_profile"
  role        = var.ec2_role
}

resource "aws_launch_template" "web_lt" {
  name                   = "web_launch_template"
  image_id               = var.web_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_ec2_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.web_instance_profile.name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web_instance"
    }
  }
}
