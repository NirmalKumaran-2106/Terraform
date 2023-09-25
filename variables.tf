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
variable "tagname" {
    type = string
    default = "Terraform_Created_Instance"
}