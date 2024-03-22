output "lb_vpclink_dns_name" {
  value = aws_lb.lb_vpclink.dns_name
}

output "lb_ingress_dns_name" {
  value = aws_lb.lb_ingress.dns_name
}
