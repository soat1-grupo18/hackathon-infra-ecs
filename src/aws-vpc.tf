module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 5.0.0, < 6.0.0"

  name = "fiap-vpc"
  cidr = var.aws_vpc_cidr

  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b", "${data.aws_region.current.name}c"]
  private_subnets = [cidrsubnet(var.aws_vpc_cidr, 8, 0), cidrsubnet(var.aws_vpc_cidr, 8, 1), cidrsubnet(var.aws_vpc_cidr, 8, 2)]
  public_subnets  = [cidrsubnet(var.aws_vpc_cidr, 8, 128), cidrsubnet(var.aws_vpc_cidr, 8, 129), cidrsubnet(var.aws_vpc_cidr, 8, 130)]

  public_subnet_tags = {
    "fiap-public-subnet" = "true"
  }

  private_subnet_tags = {
    "fiap-private-subnet" = "true"
  }

  enable_nat_gateway = true
  single_nat_gateway = true # optimizing costs instead of high availability
}
