module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.3.0"
  identifier = "dninstance"
  

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  engine_version       = "8.0"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t2.medium"

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "proj1Mysql"
  username = "user"
  password = "captain@12345"
  port     = 3306
  
  publicly_accessible = false
  skip_final_snapshot = true
  multi_az               = false
  db_subnet_group_name   = module.vpc.database_subnet_group.name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

}


