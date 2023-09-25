resource "aws_instance" "Terraform_Servers" {
    ami = "var.ami"
    instance_type = "var.instance_type"
    subnet_id = "var.subnet_id"
    security_groups = ["var.security_groups"]
    key_name = "keys"
    tags = {
        Name = "var.tagname"
    } 
}