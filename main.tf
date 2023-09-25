resource "aws_instance" "trial" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"
    user_data = <<-EOF
    ${file("userdata.sh")}
    key_name = "keys"
    tags = {
        Name = "trialinstance"
    }
}