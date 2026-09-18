module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 9.0"

  name           = var.name
  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode

  cluster_instance_class = var.cluster_instance_class
  instances              = var.instances

  vpc_id                       = var.vpc_id
  db_subnet_group_name         = var.db_subnet_group_name
  security_group_ingress_rules = var.security_group_ingress_rules

  master_username             = var.master_username
  manage_master_user_password = var.manage_master_user_password
  database_name               = var.database_name
  port                        = var.port

  storage_encrypted   = var.storage_encrypted
  kms_key_id          = var.kms_key_id
  apply_immediately   = var.apply_immediately
  monitoring_interval = var.monitoring_interval

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = var.tags
}
