variable "sg_id" {
  description = "SG ID for application load balancer"
  type = string
}

variable "subnets" {
  description = "subnets for ALB"
  type = list(string)
}


variable "vpc_id" {
  description = "VPC ID"
  type = string
}


variable "instances" {
  description = "Instances ID for target group attachment"
  type = list(string)
}