resource "aws_lb" "lb_ingress" {
  name               = "fiap-lb-ingress"
  internal           = true
  load_balancer_type = "network"
  subnets            = module.vpc.private_subnets

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "lb_ingress_http_prod" {
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
