output "aurora_cluster_endpoint" {
  value = module.aurora_postgresql.cluster_endpoint
}

output "aurora_reader_endpoint" {
  value = module.aurora_postgresql.reader_endpoint
}

output "aurora_security_group_id" {
  value = module.aurora_postgresql.security_group_id
}

output "aurora_master_user_secret_arn" {
  value = module.aurora_postgresql.master_user_secret_arn
}
