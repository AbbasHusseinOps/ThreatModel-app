output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}
