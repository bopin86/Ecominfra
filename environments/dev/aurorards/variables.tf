variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

variable "data_subnet_ids" {
  description = "Private data subnet IDs for Aurora"
  type        = list(string)
}

variable "ecs_service_security_group_id" {
  description = "ECS service security group allowed to connect to Aurora"
  type        = string
}
