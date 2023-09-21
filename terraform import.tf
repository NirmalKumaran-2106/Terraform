resource "aws_instance" "Import" {
    ami_id = "ami-0ff30663ed13c2290"
    instance_type = "t2.micro"  
}