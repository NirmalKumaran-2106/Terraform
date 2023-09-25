variable "ami" {
    type = string
    default = "ami-067c21fb1979f0b27"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "tagname" {
    type = string
    default = "trialinstance"
}