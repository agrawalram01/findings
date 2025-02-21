output "public_IP" {
  value = aws_instance.web_server.public_ip
}

output "key_name" {
  value = aws_instance.web_server.key_name
}

output "subnet_id" {
  value = aws_instance.web_server.subnet_id
}