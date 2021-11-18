# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-047a51fa27710816e" # Amazon Linux
  instance_type          = "t2.micro"
  key_name               = "nova-keys"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.OMS-SG.id]
  tags = {
    "Name" = "myec2vm"
  }


  # PLAY WITH /tmp folder in EC2 Instance with File Provisioner
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = self.public_ip # Understand what is "self"
    user        = "ec2-user"
    password    = ""
    private_key = file("file-path/nova-keys.pem")
  }


  # Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "file-path/apache-install.sh"
    destination = "/tmp/apache-install.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo service start httpd",
      "sudo service start httpd"
      ]
  }

}









