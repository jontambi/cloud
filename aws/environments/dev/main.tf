provider "aws" {
  region = "us-east-1"
}

module "aws_vpc_dev" {
  source = "../../modules/aws-vpc"
}

module "aws_eks_cluster_dev" {
  source = "../../modules/aws-eks"
  vpc_id = module.aws_vpc_dev.vpc_id
}
