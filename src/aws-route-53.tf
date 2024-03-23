resource "aws_route53_zone" "private" {
  name = "hackathon.fiap.local"

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

resource "aws_route53_record" "alb" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "*.hackathon.fiap.local"
  type    = "A"

  alias {
    name                   = aws_lb.lb_ingress.dns_name
    zone_id                = aws_lb.lb_ingress.zone_id
    evaluate_target_health = true
  }
}