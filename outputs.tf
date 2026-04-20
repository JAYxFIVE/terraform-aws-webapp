output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "web_instance_id" {
  value = module.ec2.web_instance_id
}

