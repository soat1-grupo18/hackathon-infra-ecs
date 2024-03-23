variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ecs_cluster_name" {
  type    = string
  default = "fiap-ecs-cluster"
}

variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
