resource "aws_instance" "trial" {
    count = var.count
    ami = var.ami
    instance_type = var.instance_type
    key_name = "Dev--Ops"
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 29
    volume_type           = "gp2"
    delete_on_termination = true
  }
    tags = {
        Name = var.Name
    }
}