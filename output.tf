# Variables de salida

# output "ec2-instance-id" {
#   value = aws_instance.instance-adservice.id
# }

output "services-private-subnet-id" {
  value = aws_subnet.services-private-subnet.id
}

output "services-private-subnet-2-id" {
  value = aws_subnet.services-private-subnet-2.id
}

output "services-sg-id" {
  value = aws_security_group.services-sg.id
}