resource "aws_route53_record" "www" {
  zone_id = "Z0884333372FWSLSTUFFU"
  name    = "dashboard.ctllearning.click"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_alb.dashboard_alb.dns_name]
}