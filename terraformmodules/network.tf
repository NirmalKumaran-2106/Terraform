resource "aws_vpc" "network-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "terraform-vpc"
    }
}
resource "aws_subnet" "network-subnet" {
    vpc_id = aws_vpc.network-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "terraform-subnet"
    }
}
resource "aws_route_table" "network-routetable" {
    vpc_id = aws_vpc.network-vpc.id
    tags = {
      Name = "terraform-routetable"
    }
}
resource "aws_network_acl" "network-networkacl" {
    vpc_id = aws_vpc.network-vpc.id
    tags = {
      Name = "terraform-network-acl"
    }
}
resource "aws_internet_gateway" "network-internetgateway" {
    tags = {
      Name = "terraform-internetgateway"
    }
}
resource "aws_internet_gateway_attachment" "network-internetgatewayattachment" {
    vpc_id = aws_vpc.network-vpc.id
    internet_gateway_id = aws_internet_gateway.network-internetgateway.id
}
resource "aws_security_group" "network-securitygroup" {
    vpc_id = aws_vpc.network-vpc.id
    tags = {
      Name = "terraform-securitygroup"
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 65535
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}