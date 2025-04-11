resource "aws_rds_global_cluster" "aurora_global_db" {
  global_cluster_identifier = "aurora-global-db"
  engine                    = "aurora-postgresql"
  engine_version            = "16.6"
  provider                  = aws.primary_region
}
