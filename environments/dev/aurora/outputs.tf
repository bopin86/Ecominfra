output "cluster_endpoint" {
  description = "Writer endpoint"
  value       = module.aurora.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "Reader endpoint"
  value       = module.aurora.cluster_reader_endpoint
}

output "cluster_port" {
  description = "Database port"
  value       = module.aurora.cluster_port
}

output "cluster_identifier" {
  description = "Aurora cluster identifier"
  value       = module.aurora.cluster_identifier
}

output "security_group_id" {
  description = "Cluster security group ID"
  value       = module.aurora.security_group_id
}

output "master_user_secret" {
  description = "Secrets Manager secret holding the master password"
  value       = module.aurora.cluster_master_user_secret
  sensitive   = true
}
