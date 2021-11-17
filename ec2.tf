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
      "sudo systemctl httpd start",
      "sudo systemctl enable httpd"
      ]
  }
  /*
  # Copies the app1 folder to /tmp - FOLDER COPY
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

  # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
  provisioner "file" {
    source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
    destination = "/tmp"
  }
*/
  /*
# 2nd TEST with failures "Continue" or "fail"
# Enable this during Section 09-01 Step-05
 # Copies the file-copy.html file to /var/www/html/file-copy.html where ec2-user don't have permission to copy. The user needs "sudo" permissions
 # This provisioner will fail but we don't want to taint the resource, we want to continue on_failure
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/var/www/html/file-copy.html"  # With this terraform will first fail "Permission Denied", If you run terraform apply again it will "tain" the resource and destroys and recreate.
    #on_failure  = continue  # Uncomment this during Test-2 if you don't want terraform to destroy the resource
   }
*/
}









