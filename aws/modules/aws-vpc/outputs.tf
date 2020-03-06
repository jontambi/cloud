output "vpc_id" {
  value = aws_vpc.go-services.id
}

output "subnet_id" {
  value = aws_subnet.go-services[*].id
}