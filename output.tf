output "aws_webserver_instance_id" {
  description = "output webserver instance id"
  value       = aws_instance.my-ec2-vm.public_ip

}


output "aws_security_group_id" {
  description = "output webserver security group id"
  value       = aws_security_group.OMS-SG.id

}