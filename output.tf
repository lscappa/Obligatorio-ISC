# Variables de salida

# Obtener el ID de la cuenta actual
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# Obtener el ARN del rol IAM
output "role_arn" {
  value = data.aws_iam_role.current.arn
}