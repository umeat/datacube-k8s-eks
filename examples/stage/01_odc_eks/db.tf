# Database
module "db" {
  source = "../../../aws_rds"

  # Label prefix for db resources
  name = module.odc_cluster_label.id

  # Networking
  vpc_id                = module.odc_eks.vpc_id
  database_subnet_group = module.odc_eks.database_subnets

  db_name         = local.db_name
  rds_is_multi_az = local.db_multi_az
  # extra_sg could be empty, so we run compact on the list to remove it if it is
  access_security_groups = [module.odc_eks.node_security_group]
  #Engine version
  engine_version = local.db_engine_version


  # Tags
  owner       = local.owner
  namespace   = local.namespace
  environment = local.environment
}
