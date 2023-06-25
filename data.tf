# Consultar la identidad actual
data "aws_caller_identity" "current" {}

# Consultar información del rol IAM
data "aws_iam_role" "current" {
  name = "LabRole"
}