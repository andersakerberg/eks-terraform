module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.47"

  name                 = var.aws.network.name
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
}
