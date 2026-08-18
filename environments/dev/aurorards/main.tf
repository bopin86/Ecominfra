module "aurora" {
  source = "../../../modules/aurora-postgresql"

  name           = "dev-ecom-aurora-postgresql"
  engine_version = "16.4"

  vpc_id          = var.vpc_id
  data_subnet_ids = var.data_subnet_ids

  instance_class = "db.t4g.medium"

  instances = {
    one = {}
  }

  master_username = "dbadmin"

  cluster_parameter_group_name = "default.aurora-postgresql16"
  db_parameter_group_name      = "default.aurora-postgresql16"

  security_group_ingress_rules = {
    ecs_service = {
      referenced_security_group_id = var.ecs_service_security_group_id
      from_port                    = 5432
      to_port                      = 5432
      ip_protocol                  = "tcp"
      description                  = "Allow PostgreSQL access from ECS service"
    }
  }

  backup_retention_period = 7
  deletion_protection     = false
  apply_immediately       = true

  tags = {
    Project     = "Ecominfra"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
