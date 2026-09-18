output "cluster_identifier" {
  description = "Aurora cluster identifier"
  value       = module.cluster.cluster_id
}

output "cluster_arn" {
  description = "Aurora cluster ARN"
  value       = module.cluster.cluster_arn
}

output "cluster_endpoint" {
  description = "Writer endpoint"
  value       = module.cluster.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "Reader endpoint"
  value       = module.cluster.cluster_reader_endpoint
}

output "cluster_port" {
  description = "Database port"
  value       = module.cluster.cluster_port
}

output "cluster_database_name" {
  description = "Initial database name"
  value       = module.cluster.cluster_database_name
}

output "cluster_master_username" {
  description = "Master username"
  value       = module.cluster.cluster_master_username
  sensitive   = true
}

output "cluster_master_user_secret" {
  description = "Secrets Manager secret holding the managed master password"
  value       = module.cluster.cluster_master_user_secret
  sensitive   = true
}

output "security_group_id" {
  description = "Cluster security group ID"
  value       = module.cluster.security_group_id
}
