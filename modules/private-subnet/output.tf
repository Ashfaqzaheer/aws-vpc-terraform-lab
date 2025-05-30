output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "route_table_id" {
  value = aws_route_table.private.id  # or whatever your route table resource is called
}

