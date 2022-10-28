# This is security group of bastion host
module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.15.0"

  name        = "bastion-sg"
  description = "Security group for EC2 bastion host"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block  
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}

# This is security group for private subnets

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name        = "private-sg"
  description = "Security group for EC2s in private subnets"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = ["ssh-tcp", "http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  tags = local.common_tags  
}


