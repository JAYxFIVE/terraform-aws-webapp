output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "rds_subnet_group" {
  value = aws_db_subnet_group.main.name
}