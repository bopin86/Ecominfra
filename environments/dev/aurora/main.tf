module "aurora" {
  source = "../../../modules/aurora"

  name           = var.name
  engine         = var.engine
  engine_version = var.engine_version

  cluster_instance_class = var.cluster_instance_class

  # Dev environment - single writer instance only
  instances = {
    one = {}
  }

  vpc_id                       = var.vpc_id
  db_subnet_group_name         = var.db_subnet_group_name
  security_group_ingress_rules = var.security_group_ingress_rules

  master_username             = var.master_username
  manage_master_user_password = true
  database_name               = var.database_name
  port                        = var.port

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = var.monitoring_interval

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  deletion_protection = false
  skip_final_snapshot = true

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = var.tags
}
