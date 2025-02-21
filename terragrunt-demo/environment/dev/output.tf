output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "public_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}