resource "aws_instance" "trial" {
    count = 3
    ami = "ami-03d294e37a4820c21"
    instance_type = "t2.micro"
    key_name = "Dev--Ops"
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 29
    volume_type           = "gp2"
    delete_on_termination = true
  }
    tags = {
        Name = "trialinstance"
    }
}