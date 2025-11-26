// Source - https://stackoverflow.com/q
// Posted by sudlo, modified by community. See post 'Timeline' for change history
// Retrieved 2025-11-26, License - CC BY-SA 4.0

data "aws_ami" "amazon-2" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
    
    filter {
        name = "virtualization - type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}

data "aws_availability_zones" "available" {
  state = "available"
}
