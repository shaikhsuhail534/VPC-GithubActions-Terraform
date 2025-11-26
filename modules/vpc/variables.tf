variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
}

variable "subnet_cidr" {
  description = "SUBNET CIDR"
  type = list(string)
}

variable "subnet_names" {
  description = "subnet names"
  type = list(string)
  default = [ "Publicsubnet1", "Publicsubnet2" ]
}