resource "aws_lb" "lb_ingress" {
  name               = "fiap-lb-ingress"
  internal           = true
  load_balancer_type = "application"
  subnets            = module.vpc.private_subnets
  security_groups    = [aws_security_group.fiap_lb_ingress.arn]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "lb_ingress" {
  load_balancer_arn = aws_lb.lb_ingress.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = 404
      message_body = "Not found on ALB."
    }
  }
}
