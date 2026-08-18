module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 9.0"

  name           = var.name
  engine         = "aurora-postgresql"
  engine_version = var.engine_version

  instances = var.instances

  vpc_id               = var.vpc_id
  subnets              = var.data_subnet_ids
  create_db_subnet_group = true

  vpc_security_group_ids = var.security_group_ids

  master_username             = var.master_username
  manage_master_user_password = true

  storage_encrypted = true

  create_db_cluster_parameter_group = false
  create_db_parameter_group         = false

  db_cluster_parameter_group_name = var.cluster_parameter_group_name
  db_parameter_group_name         = var.db_parameter_group_name

  backup_retention_period = var.backup_retention_period

  tags = var.tags
}
