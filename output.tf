# Variables de salida

# output "ec2-instance-id" {
#   value = aws_instance.instance-adservice.id
# }

# Output para mostrar el ID de la subred privada
output "data-services-private-subnet-id" {
  value = data.aws_subnet.services_private_subnet.id
}

output "data-services-private-subnet-2-id" {
  value = data.aws_subnet.services_private_subnet_2.id
}

output "data-services-sg-id" {
  value = data.aws_security_group.services_sg.id
}

# output "services-private-subnet-id" {
#   value = aws_subnet.services-private-subnet.id
# }

# output "services-private-subnet-2-id" {
#   value = aws_subnet.services-private-subnet-2.id
# }

# output "services-sg-id" {
#   value = aws_security_group.services-sg.id
# }

# Obtener el ID de la cuenta actual
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# Obtener el ARNde la cuenta actual
output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

# Obtener el ID de usuario actual
output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

# Obtener el ARN del rol IAM
output "role_arn" {
  value = data.aws_iam_role.current.arn
}