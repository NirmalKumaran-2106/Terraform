variable "ami" {
    type = string
    default = "ami-03d294e37a4820c21"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "countnum" {
    type = number
    default = 1
}
variable "volumesize" {
    type = number
    default = 29
}