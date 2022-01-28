output "LB_DNS_Name" {
  value = aws_alb.dashboard_alb.dns_name
}

output "Route53_DNS_Name" {
  value = "https://dashboard.ctllearning.click/CrudDemoWithMySql/"
}
