module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 10.0"

  name           = var.name
  engine         = "aurora-postgresql"
  engine_version = var.engine_version

  vpc_id  = var.vpc_id
  subnets = var.data_subnet_ids

  create_db_subnet_group = true

  cluster_instance_class = var.instance_class

  instances = var.instances

  master_username             = var.master_username
  manage_master_user_password = true

  storage_encrypted = true
  kms_key_id        = var.kms_key_id

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  deletion_protection = var.deletion_protection
  apply_immediately   = var.apply_immediately

  enabled_cloudwatch_logs_exports = ["postgresql"]

  create_db_cluster_parameter_group = false
  create_db_parameter_group         = false

  db_cluster_parameter_group_name = var.cluster_parameter_group_name
  db_parameter_group_name         = var.db_parameter_group_name

  security_group_ingress_rules = var.security_group_ingress_rules

  tags = var.tags
}
