resource "aws_security_group" "fiap_lb_ingress" {
  name        = "fiap-lb-ingress"
  description = "allows lb traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "lb port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      var.aws_vpc_cidr
    ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
