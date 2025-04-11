resource "aws_iam_instance_profile" "app_ec2_ssm_instance_profile" {
  name_prefix = "app_ec2_ssm_instance_profile"
  role        = var.ec2_ssm_role
}

#launch template
resource "aws_launch_template" "app_launch_template" {
  name                   = "app_launch_template"
  image_id               = var.app_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.app_ec2_sg.id]
  iam_instance_profile {
    name = aws_iam_instance_profile.app_ec2_ssm_instance_profile.name
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app_instance"
    }
  }
}
