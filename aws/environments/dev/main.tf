module "aws_vpc_dev" {
  source = "../../modules/aws-vpc"
}

module "aws_eks_cluster_dev" {
  source = "../../modules/aws-eks"
  vpc_id = module.aws_vpc_dev.vpc_id
  subnet_id = module.aws_vpc_dev.subnet_id
}
