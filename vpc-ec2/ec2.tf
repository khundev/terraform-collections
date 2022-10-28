# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  # insert the 10 required variables here
  name = "${var.environment}-BastionHost"
  ami = data.aws_ami.amzlinux2.id 
  instance_type = var.instance_type
  key_name = var.instance_keypair
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]    
  tags = local.common_tags
}

# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "${var.environment}-app"
  ami = data.aws_ami.amzlinux2.id 
  instance_type = var.instance_type
  user_data = file("${path.module}/user-data.sh")
  key_name = var.instance_keypair
  #subnet_id = module.vpc.private_subnets[0] # Single Instance
  vpc_security_group_ids = [module.private_sg.this_security_group_id]    
  instance_count = var.instance-count
  subnet_ids = module.vpc.private_subnets[*]
  tags = local.common_tags
}