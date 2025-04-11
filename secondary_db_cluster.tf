resource "aws_rds_cluster" "aurora_secondary_cluster" {
  cluster_identifier             = "aurora-secondary-cluster"
  global_cluster_identifier      = aws_rds_global_cluster.aurora_global_db.id
  engine                         = aws_rds_global_cluster.aurora_global_db.engine
  engine_version                 = aws_rds_global_cluster.aurora_global_db.engine_version
  db_subnet_group_name           = module.region2_db.db_subnet_group
  vpc_security_group_ids         = [module.region2_db.db_sg]
  enable_global_write_forwarding = true
  apply_immediately              = true
  allow_major_version_upgrade    = true
  skip_final_snapshot            = true

  lifecycle {
    ignore_changes = [
      replication_source_identifier,
      engine_version
    ]
  }

  depends_on = [
    aws_rds_cluster.aurora_primary_cluster,
    aws_rds_cluster_instance.aurora_primary_instances
  ]

  provider = aws.secondary_region
}


resource "aws_rds_cluster_instance" "aurora_secondary_instances" {
  count              = 2
  identifier         = "aurora-secondary-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora_secondary_cluster.id
  engine             = aws_rds_global_cluster.aurora_global_db.engine
  engine_version     = aws_rds_global_cluster.aurora_global_db.engine_version
  instance_class     = "db.r7g.large"
  availability_zone  = element(["${var.region2}a", "${var.region2}b"], count.index)
  apply_immediately  = true

  provider = aws.secondary_region
}
