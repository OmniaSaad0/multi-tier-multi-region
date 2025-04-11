resource "aws_rds_cluster" "aurora_primary_cluster" {
  cluster_identifier            = "aurora-primary-cluster"
  global_cluster_identifier     = aws_rds_global_cluster.aurora_global_db.id
  engine                        = aws_rds_global_cluster.aurora_global_db.engine
  engine_version                = aws_rds_global_cluster.aurora_global_db.engine_version
  master_username               = var.db_master_username
  master_password               = var.db_master_password
  database_name                 = "postgres_db"
  db_subnet_group_name          = module.region1_db.db_subnet_group
  vpc_security_group_ids        = [module.region1_db.db_sg]
  enable_local_write_forwarding = true
  apply_immediately             = true
  allow_major_version_upgrade   = true
  skip_final_snapshot           = true

  lifecycle {
    ignore_changes = [engine_version]
  }

  provider = aws.primary_region
}

resource "aws_rds_cluster_instance" "aurora_primary_instances" {
  count              = 2
  identifier         = "aurora-primary-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora_primary_cluster.id
  engine             = aws_rds_global_cluster.aurora_global_db.engine
  engine_version     = aws_rds_global_cluster.aurora_global_db.engine_version
  instance_class     = "db.r7g.large"
  availability_zone  = element(["${var.region1}a", "${var.region1}b"], count.index)
  apply_immediately  = true

  provider = aws.primary_region
}
