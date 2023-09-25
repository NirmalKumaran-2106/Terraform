resource "aws_instance" "Terraform_Servers" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "var.instance_type"
    subnet_id = "var.subnet_id"
    key_name = "keys"
    tags = {
        Name = "var.tagname"
    } 
}