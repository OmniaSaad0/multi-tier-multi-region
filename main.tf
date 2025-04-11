module "region1_network" {
  source         = "./modules/network"
  region         = var.region1
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  web = ["10.0.3.0/24", "10.0.4.0/24"]

  app = ["10.0.5.0/24", "10.0.6.0/24"]

  db = ["10.0.7.0/24", "10.0.8.0/24"]

  providers = {
    aws = aws.primary_region
  }

}

module "region2_network" {
  source         = "./modules/network"
  region         = var.region2
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  web = ["10.0.3.0/24", "10.0.4.0/24"]

  app = ["10.0.5.0/24", "10.0.6.0/24"]

  db = ["10.0.7.0/24", "10.0.8.0/24"]
  providers = {
    aws = aws.secondary_region
  }
}


module "region1_web" {
  source         = "./modules/web"
  aws_region     = var.region1
  web_ami        = var.web_ami_region1
  vpc_id         = module.region1_network.my_vpc
  public_subnet1 = module.region1_network.public_subnet1
  public_subnet2 = module.region1_network.public_subnet2
  web_subnet1    = module.region1_network.web_subnet1
  web_subnet2    = module.region1_network.web_subnet2
  ec2_role       = aws_iam_role.ec2_ssm_role.name
  providers = {
    aws = aws.primary_region
  }
}

module "region2_web" {
  source         = "./modules/web"
  aws_region     = var.region2
  web_ami        = var.web_ami_region2
  vpc_id         = module.region2_network.my_vpc
  public_subnet1 = module.region2_network.public_subnet1
  public_subnet2 = module.region2_network.public_subnet2
  web_subnet1    = module.region2_network.web_subnet1
  web_subnet2    = module.region2_network.web_subnet2
  ec2_role       = aws_iam_role.ec2_ssm_role.name
  providers = {
    aws = aws.secondary_region
  }
}

module "region1_app" {
  source       = "./modules/app"
  aws_region   = var.region1
  app_ami      = var.app_ami_region1
  vpc_id       = module.region1_network.my_vpc
  app_subnet1  = module.region1_network.app_subnet1
  app_subnet2  = module.region1_network.app_subnet2
  ec2_ssm_role = aws_iam_role.ec2_ssm_role.name
  web_ec2_sg   = module.region1_web.web_ec2_sg
  providers = {
    aws = aws.primary_region
  }
}

module "region2_app" {
  source       = "./modules/app"
  aws_region   = var.region2
  app_ami      = var.app_ami_region2
  vpc_id       = module.region2_network.my_vpc
  app_subnet1  = module.region2_network.app_subnet1
  app_subnet2  = module.region2_network.app_subnet2
  ec2_ssm_role = aws_iam_role.ec2_ssm_role.name
  web_ec2_sg   = module.region2_web.web_ec2_sg

  providers = {
    aws = aws.secondary_region
  }
}

module "region1_db" {
  source     = "./modules/db"
  vpc_id     = module.region1_network.my_vpc
  db_subnet1 = module.region1_network.db_subnet1
  db_subnet2 = module.region1_network.db_subnet2
  app_ec2_sg = module.region1_app.app_ec2_sg
  providers = {
    aws = aws.primary_region
  }
}

module "region2_db" {
  source     = "./modules/db"
  vpc_id     = module.region2_network.my_vpc
  db_subnet1 = module.region2_network.db_subnet1
  db_subnet2 = module.region2_network.db_subnet2
  app_ec2_sg = module.region2_app.app_ec2_sg
  providers = {
    aws = aws.secondary_region
  }
}


