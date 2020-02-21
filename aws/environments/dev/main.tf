provider "aws" {
  region = "us-east-1"
}

module "aws_vpc_dev" {
  source = "../../modules/aws-vpc"
}
