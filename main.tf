resource "aws_instance" "Create" {
    ami = "ami-0ff30663ed13c2290"
    instance_type = "t2.micro"
    subnet_id = "subnet-0d43264eccbc34163"
    security_groups = "sg-0b09b2f028eed63b2"
    key_name = "DevOps-PPK-Keypair"
    tags = {
        Name = "Trial_create"
    } 
}