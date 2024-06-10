//general variables
variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

//vpc variables
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type = string
}

variable "private_subnet1_cidr" {
  description = "Private subnet1 CIDR block"
  type = string
}

variable "private_subnet2_cidr" {
  description = "Private subnet2 CIDR block"
  type = string
}

variable "public_subnet1_cidr" {
  description = "Public subnet1 CIDR block"
  type = string
}

variable "public_subnet2_cidr" {
  description = "Public subnet2 CIDR block"
  type = string
}

//eks variables
variable "eks_name" {
  description = "EKS cluster name"
  type = string
}

variable "eks_role_name" {
  description = "EKS cluster role"
  type = string
}

variable "eks_node_group_name" {
  description = "EKS node group name"
  type = string
}
variable "eks_node_role_name" {
  description = "EKS nodes role"
  type = string
}

variable "eks_nodes_capacity_type" {
  description = "EKS nodes capacity type"
  type = string
}

variable "eks_node_type" {
  description = "EKS nodes instance type"
  type = list(string)
}

variable "eks_node_min_count" {
  description = "EKS nodes min count"
  type = number
}

variable "eks_node_max_count" {
  description = "EKS nodes max count"
  type = number
}

//rds variables
variable "rds_name" {
  description = "RDS instance name"
  type = string
}

variable "rds_db_engine" {
  description = "RDS db engine type"
  type = string
}

variable "rds_username" {
  description = "RDS db username"
  type = string
}

variable "rds_password" {
  description = "RDS db password"
  type = string
  sensitive = true
}

variable "rds_db_engine_version" {
  description = "RDS db engine version"
  type = string
}

variable "rds_db_instance_type" {
  description = "RDS db instance type"
  type = string
}

variable "rds_public_access" {
  description = "RDS public access"
  type = bool
  default = true
}

variable "rds_iam_db_auth" {
  description = "RDS IAM db authentication"
  type = bool
  default = true
}

variable "rds_iam_db_auth_user" {
  description = "RDS IAM db authentication enabled user"
  type = string
}