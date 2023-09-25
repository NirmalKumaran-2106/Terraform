provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAX7GUTVZRWIL7TLOQ"
    secret_key = "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"
}
resource "aws_instance" "Server" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"
    subnet_id = "subnet-0f362b581a43ce5ce"
    security_groups = ["sg-0715215d2df1a5a75"]
    key_name = "keys"
    tags = {
        Name = "Terraform_Created_Instance"
    } 
}