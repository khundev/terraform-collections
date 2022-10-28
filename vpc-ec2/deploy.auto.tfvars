# General variables
# ------------------
environment = "dev"
division  = "TechOps"
aws_region = "ap-southeast-1"

# VPC module variables
# ---------------------
vpc_name = "main"
vpc_cidr_block = "10.10.0.0/16"

vpc_availability_zones  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
vpc_public_subnets      = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
vpc_private_subnets     = ["10.10.40.0/24", "10.10.50.0/24", "10.10.60.0/24"]
vpc_database_subnets    = ["10.10.70.0/24", "10.10.80.0/24", "10.10.90.0/24"]

vpc_create_database_subnet_group        = true
vpc_create_database_subnet_route_table  = true

vpc_enable_nat_gateway = true
vpc_single_nat_gateway = false
vpc_nat_per_az = true

# EC2 module variables
# -------------------
instance_type   = "t2.micro"
instance_keypair = "ec2-key"
instance-count = 3


