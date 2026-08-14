module "aurora_postgresql" {
  source = "../../modules/aurora-postgresql"

  name        = "dev-ecom-aurora-postgresql"
  environment = var.environment

  engine_version = "16.4"
  database_name  = "devecomdb"
  master_username = "dbadmin"

  vpc_id        = var.vpc_id
  db_subnet_ids = var.db_subnet_ids
  db_cluster_parameter_group_name = var.cluster_parameter_group_name
  db_parameter_group_name         = var.db_parameter_group_name
  allowed_security_group_ids = var.app_security_group_ids

  instance_class = "db.t4g.micro"
  instance_count = 1

  backup_retention_period = 7
  deletion_protection     = false
  apply_immediately       = true

  storage_encrypted = true

  tags = {
    Project     = "Ecominfra"
    Environment = "dev"
    Owner       = "Bopin"
  }
}
