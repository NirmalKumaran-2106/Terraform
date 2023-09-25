resource "aws_instance" "Terraform_Servers" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"
    subnet_id = "subnet-0f362b581a43ce5ce"
    security_groups = ["sg-0715215d2df1a5a75"]
    key_name = "keys"
    tags = {
        Name = "Terraform_Created_Instance"
    } 
}