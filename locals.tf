# Local Values to use across this folder

locals {
  owners = var.division
  environment = var.environment
  name = "${var.division}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 
