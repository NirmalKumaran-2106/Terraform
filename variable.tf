variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "security_groups" {
    type = string
    default = "sg-0715215d2df1a5a75"
}
variable "subnet_id" {
    type = string
    default = "subnet-0f362b581a43ce5ce"
}
variable "ami" {
    type = string
    default = "ami-067c21fb1979f0b27"
}
variable "tagname" {
    type = string
    default = "Terraform_Created_Instance"
}