resource "aws_instance" "test_instance" {
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-00c565875394dcd98"]
    instance_type = "t3.micro"

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > private-ip.txt"      
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
}