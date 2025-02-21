output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "public_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.instance.id
}