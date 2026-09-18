variable "name" {
  description = "Name of the Aurora cluster"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "Engine version"
  type        = string
}

variable "engine_mode" {
  description = "Engine mode (provisioned or serverless)"
  type        = string
  default     = "provisioned"
}

variable "cluster_instance_class" {
  description = "Default instance class applied to all instances"
  type        = string
}

variable "instances" {
  description = "Map of cluster instances to create"
  type        = any
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID where the cluster is deployed"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Existing DB subnet group name"
  type        = string
}

variable "security_group_ingress_rules" {
  description = "Ingress rules for the cluster security group"
  type        = any
  default     = {}
}

variable "master_username" {
  description = "Master DB username"
  type        = string
  default     = "postgres"
}

variable "manage_master_user_password" {
  description = "Let RDS manage the master password in Secrets Manager"
  type        = bool
  default     = true
}

variable "database_name" {
  description = "Initial database name"
  type        = string
  default     = null
}

variable "port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ARN for storage encryption"
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Apply changes immediately instead of during maintenance window"
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "Enhanced monitoring interval in seconds (0 to disable)"
  type        = number
  default     = 0
}

variable "backup_retention_period" {
  description = "Backup retention in days"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "Daily backup window (UTC)"
  type        = string
  default     = "02:00-03:00"
}

variable "preferred_maintenance_window" {
  description = "Weekly maintenance window (UTC)"
  type        = string
  default     = "sun:04:00-sun:05:00"
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on destroy"
  type        = bool
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Log types exported to CloudWatch"
  type        = list(string)
  default     = ["postgresql"]
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
