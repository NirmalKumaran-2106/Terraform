resource "aws_instance" "trial" {
    ami = "var.ami"
    instance_type = "var.instance_type"
    key_name = "keys"
    tags = {
        Name = "var.tagname"
    }
}