region = "eu-west-3"

name           = "dev-aurora-db-postgres"
engine         = "aurora-postgresql"
engine_version = "17.5"

# Dev sizing - single instance
cluster_instance_class = "db.t4g.large"

vpc_id               = "vpc-12345678"
db_subnet_group_name = "db-subnet-group"

security_group_ingress_rules = {
  vpc_cidr_ingress = {
    cidr_ipv4   = "10.20.0.0/20"
    from_port   = 5432
    to_port     = 5432
    ip_protocol = "tcp"
    description = "PostgreSQL from application subnets"
  }
  app_sg_ingress = {
    referenced_security_group_id = "sg-12345678"
    from_port                    = 5432
    to_port                      = 5432
    ip_protocol                  = "tcp"
    description                  = "PostgreSQL from application security group"
  }
}

master_username = "postgres"
database_name   = "appdb"
port            = 5432

monitoring_interval          = 10
backup_retention_period      = 7
preferred_backup_window      = "02:00-03:00"
preferred_maintenance_window = "sun:04:00-sun:05:00"

enabled_cloudwatch_logs_exports = ["postgresql"]

tags = {
  Environment = "dev"
  Terraform   = "true"
}
