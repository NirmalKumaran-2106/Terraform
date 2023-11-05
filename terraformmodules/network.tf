resource "aws_security_group" "network-securitygroup" {
    vpc_id = "vpc-06dfafc6a4f4921c0"
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