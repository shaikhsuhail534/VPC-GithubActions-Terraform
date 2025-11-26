output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnet_ids" {
  value = aws_subnet.subnet.*.id #as we have two subnets {*} this will gather the value and form a list
}