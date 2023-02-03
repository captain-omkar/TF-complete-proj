module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "AMI-Network"

  cidr = "10.96.0.0/21"

  igw_tags = {
    Name = "AMI-Network-us-east-1-IGW"
    }
    
  azs = ["ap-south-1a", "ap-south-1b"]

  private_subnets = ["10.96.7.0/27","10.96.7.32/27","10.96.6.0/25","10.96.6.128/25"]
  private_subnet_names = ["ami-network-tgw-subnet-1","ami-network-tgw-subnet-2","ami-network-app-subnet-1","ami-network-app-subnet-2" ]
  
  public_subnets = ["10.96.4.0/24","10.96.5.0/24","10.96.0.0/24","10.96.1.0/24","10.96.3.0/28","10.96.3.16/28"]
  public_subnet_names = ["ami-network-lb-subnet-1","ami-network-lb-subnet-2","ami-network-untrust-subnet-1","ami-network-untrust-subnet-2","ami-network-management-subnet-1","ami-network-management-subnet-2"]

  database_subnets = ["10.96.2.0/27" , "10.96.2.32/27"]
  database_subnet_names    = ["DB Subnet-1" ,"DB Subnet-2"]
  create_database_subnet_group = true

  public_route_table_tags = {
    Name = "AMI-Network-Public-RT"
  }

  
  enable_nat_gateway = true
  one_nat_gateway_per_az = true
  single_nat_gateway = false

  public_dedicated_network_acl = true
  private_dedicated_network_acl = true 

  public_acl_tags = {
    Name = "AMI-Network-Public-NACL"
  }
  private_acl_tags = {
    Name = "AMI-Network-Private-NACL"
  }

 
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

