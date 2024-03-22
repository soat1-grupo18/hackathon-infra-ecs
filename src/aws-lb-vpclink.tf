resource "aws_lb" "lb_vpclink" {
  name               = "fiap-lb-vpclink"
  internal           = true
  load_balancer_type = "network"
  subnets            = module.vpc.private_subnets

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "lb_vpclink" {
  load_balancer_arn = aws_lb.lb_vpclink.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_vpclink.arn
  }
}

resource "aws_lb_target_group" "lb_vpclink" {
  name        = "fiap-lb-vpclink"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "lb_vpclink" {
  target_group_arn = aws_lb_target_group.lb_vpclink.arn
  target_id        = aws_lb.lb_ingress.id
  port             = 80
}
