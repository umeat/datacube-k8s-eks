variable "cluster_name" {
  default = "terraform-eks"
  type    = string
}

variable "cluster_version" {
  description = "EKS Version to use with this cluster"
}

variable "admin_access_CIDRs" {
  description = "Locks ssh and api access to these IPs"
  type        = map(string)
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC to place EKS in"
}

variable "eks_subnet_ids" {
  type        = list(string)
  description = "List of subnets to place EKS workers in"
}

variable "users" {
  type = list(string)
}

variable "enable_ec2_ssm" {
  default     = true
  description = "Enables the IAM policy required for AWS EC2 System Manager."
}

variable "user_custom_policy" {
  description = "The IAM custom policy to create and attach to EKS user role"
  type        = string
  default     = ""
}

variable "user_additional_policy_arn" {
  description = "The list of pre-defined IAM policy required to EKS user role"
  type        = list(string)
  default     = []
}

variable "db_hostname" {
  type = string
  description = "DB hostname for coredns config"
  default = ""
}

variable "db_admin_username" {
  type        = string
  description = "Username for the database to store in a default kubernetes secret"
  default     = ""
}

variable "db_admin_password" {
  type        = string
  description = "Password for the database to store in a default kubernetes secret"
  default     = ""
}

variable "store_db_creds" {
  default     = false
  description = "If true, store the db_admin_username and db_admin_password variables in a kubernetes secret"
}

variable "eks_service_user" {
  type        = string
  description = "EKS Service account IAM user to manage kubernetes cluster. This will update kube-system aws-auth config mapUsers attribute if provided."
}
