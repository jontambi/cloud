#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

data "aws_availability_zones" "available" {

}

resource "aws_vpc" "go-services" {
  cidr_block = "10.0.0.0/16"

  tags = map(
    "Name", "terraform-eks-go-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_subnet" "go-services" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = "10.0.${count.index}.0/24"
  vpc_id = aws_vpc.go-services.id

  tags = map(
    "Name", "terraform-eks-go-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )

}

resource "aws_internet_gateway" "go-services" {
  vpc_id = aws_vpc.go-services.id

  tags = {
    Name = "terraform-eks-go-node"
  }
}

resource "aws_route_table" "go-services" {
  vpc_id = aws_vpc.go-services.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.go-services.id
  }
}

resource "aws_route_table_association" "go-services" {
  count = 2

  route_table_id = aws_route_table.go-services.id
  subnet_id = aws_subnet.go-services.*.id[count.index]
}