module "memcached" {
  source  = "clouddrove/elasticache/aws"
  version = "1.0.3"

  name        = "memcached"
  environment = "test"
  label_order = ["name", "environment"]

  cluster_enabled      = true
  engine               = "memcached"
  engine_version       = "1.5.10"
  family               = "memcached1.5"
  parameter_group_name = "default.memcached1.5"
  az_mode              = "cross-az"
  port                 = 11211
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 2
  subnet_ids           = module.vpc.database_subnets
  security_group_ids   = [aws_security_group.backend_sg.id]
  availability_zones   = ["ap-south-1a", "ap-south-1b"]
  
}
