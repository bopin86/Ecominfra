module "aurora" {
  source = "../../modules/aurora-postgresql"

  name           = "dev-aurora-postgresql"
  engine_version = "16.4"

  vpc_id          = module.vpc.vpc_id
  data_subnet_ids = module.vpc.data_subnet_ids

  security_group_ids = [
    module.aurora_sg.security_group_id
  ]

  instances = {
    one = {
      instance_class = "db.t4g.medium"
    }
  }

  cluster_parameter_group_name = "default.aurora-postgresql16"
  db_parameter_group_name      = "default.aurora-postgresql16"

  tags = {
    Environment = "dev"
    Project     = "Ecominfra"
  }
}
