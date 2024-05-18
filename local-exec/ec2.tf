resource "aws_instance" "test_instance" {
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-00c565875394dcd98"]
    instance_type = "t3.micro"

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private-ip.txt"      
    }

    provisioner "local-exec" {
        command = "ansbible-plabook i private-ip.txt web.yaml"      
    }
  }