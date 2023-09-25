resource "aws_instance" "trial" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"
    key_name = "keys"
    tags = {
        Name = "trialinstance"
    }
}