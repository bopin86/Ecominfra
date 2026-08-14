locals {
  common_tags = merge(
    var.tags,
    {
      Name        = var.name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Service     = "AuroraPostgreSQL"
    }
  )
}

resource "aws_db_subnet_group" "this" {
  name        = "${var.name}-subnet-group"
  description = "Subnet group for ${var.name} Aurora PostgreSQL"
  subnet_ids  = var.db_subnet_ids

  tags = local.common_tags
}

resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name} Aurora PostgreSQL"
  vpc_id      = var.vpc_id

  tags = local.common_tags
}

resource "aws_security_group_rule" "ingress_from_sg" {
  for_each = toset(var.allowed_security_group_ids)

  type                     = "ingress"
  description              = "Allow PostgreSQL from application security group"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = each.value
}

resource "aws_security_group_rule" "ingress_from_cidr" {
  for_each = toset(var.allowed_cidr_blocks)

  type              = "ingress"
  description       = "Allow PostgreSQL from CIDR"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = [each.value]
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  description       = "Allow outbound traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = ["0.0.0.0/0"]
}

db_cluster_parameter_group_name = var.cluster_parameter_group_name
db_parameter_group_name         = var.db_parameter_group_name
  
resource "aws_rds_cluster" "this" {
  cluster_identifier = var.name

  engine         = "aurora-postgresql"
  engine_version = var.engine_version

  database_name   = var.database_name
  master_username = var.master_username
  port            = var.port

  manage_master_user_password = true

  db_subnet_group_name            = aws_db_subnet_group.this.name
  vpc_security_group_ids          = [aws_security_group.this.id]
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.name

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.deletion_protection ? false : true

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  copy_tags_to_snapshot = true
  apply_immediately     = var.apply_immediately

  tags = local.common_tags
}

resource "aws_rds_cluster_instance" "this" {
  count = var.instance_count

  identifier         = "${var.name}-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.this.id

  engine         = aws_rds_cluster.this.engine
  engine_version = aws_rds_cluster.this.engine_version
  instance_class = var.instance_class

  db_subnet_group_name    = aws_db_subnet_group.this.name
  db_parameter_group_name = aws_db_parameter_group.this.name

  publicly_accessible = false

  auto_minor_version_upgrade = true
  apply_immediately          = var.apply_immediately

  tags = merge(
    local.common_tags,
    {
      InstanceNumber = tostring(count.index + 1)
    }
  )
}
