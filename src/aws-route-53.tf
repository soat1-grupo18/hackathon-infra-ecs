resource "aws_route53_zone" "private" {
  name = "internal.hackathon.fiap.com"

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

resource "aws_route53_record" "alb" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "*.internal.hackathon.fiap.com"
  type    = "A"

  alias {
    name                   = aws_lb.lb_ingress.dns_name
    zone_id                = aws_lb.lb_ingress.zone_id
    evaluate_target_health = true
  }
}