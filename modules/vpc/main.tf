#VPC

 resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}


#2subnets

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet_cidr[count.index]
  count = length(var.subnet_cidr)
  availability_zone = data.aws_availability_zones.available
  map_public_ip_on_launch = true

  
  tags = {
    Name = var.subnet_names[count.index]
  }
}

#Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}


#route table

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "10.0.0.0./0"  #public
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyRoutetable"
  }
}


#route table association
resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}