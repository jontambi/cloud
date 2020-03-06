#
# Variables Configuration
#
variable "cluster-name" {
  default = "terraform-eks-go"
  type = string
}

variable "vpc_id" {}
variable "subnet_id" {}
