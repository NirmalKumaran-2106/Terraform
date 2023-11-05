resource "aws_instance" "terraform_slave" {
    count = var.countnum
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keyname
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.volumesize
    volume_type           = "gp2"
    delete_on_termination = true
  }
    tags = {
        Name = "Terraform Slave"
    }
    provisioner "remote-exec" {
      connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("./terraformkey.pem")
      }
      inline = [ "sudo yum update -y",
        "sudo yum install git -y",
        "git clone https://github.com/NirmalKumaran-2106/StartUp-Commands",
        "sudo chmod 777 /home/ec2-user/StartUp-Commands/terraform_slave.sh",
        "sudo cd /home/ec2-user/StartUp-Commands/",
        "sudo rm -rf ansible_master.sh jenkins_master.sh README.md Jenkinsfile",
        "/home/ec2-user/StartUp-Commands/./terraform_slave.sh" ]
    }
}
resource "aws_instance" "jenkins_master" {
    count = var.countnum
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keyname
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.volumesize
    volume_type           = "gp2"
    delete_on_termination = true
  }
    tags = {
        Name = "Jenkins Master"
    }
    provisioner "remote-exec" {
      connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("./terraformkey.pem")
      }
      inline = [ "sudo yum update -y",
        "sudo yum install git -y",
        "git clone https://github.com/NirmalKumaran-2106/StartUp-Commands",
        "sudo chmod 777 /home/ec2-user/StartUp-Commands/jenkins_master.sh",
        "sudo cd /home/ec2-user/StartUp-Commands/",
        "sudo rm -rf ansible_master.sh terraform_slave.sh README.md Jenkinsfile",
        "/home/ec2-user/StartUp-Commands/./jenkins_master.sh" ]
    }
}
resource "aws_instance" "ansible_master" {
    count = var.countnum
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keyname
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.volumesize
    volume_type           = "gp2"
    delete_on_termination = true
  }
    tags = {
        Name = "Ansible Master"
    }
    provisioner "remote-exec" {
      connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("./terraformkey.pem")
      }
      inline = [ "sudo yum update -y",
        "sudo yum install git -y", //Installing GIT
        "git clone https://github.com/NirmalKumaran-2106/StartUp-Commands", //Cloning the git repository
        "sudo chmod 777 /home/ec2-user/StartUp-Commands/ansible_master.sh", //Give admin permissions 
        "sudo cd /home/ec2-user/StartUp-Commands/", //Getting into the folder
        "sudo rm -rf terraform_slave.sh jenkins_master.sh README.md Jenkinsfile", //Removing unncessary files
        "/home/ec2-user/StartUp-Commands/./ansible_master.sh" ] //Execting the config file
    }
}