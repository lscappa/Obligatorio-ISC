# Consultar información de subred privada
data "aws_subnet" "services_private_subnet" {
  id = aws_subnet.services-private-subnet.id
}

data "aws_subnet" "services_private_subnet_2" {
  id = aws_subnet.services-private-subnet-2.id
}

# Consultar información del grupo de seguridad
data "aws_security_group" "services_sg" {
  id = aws_security_group.services-sg.id
}

# Consultar la identidad actual
data "aws_caller_identity" "current" {}

# Consultar información del rol IAM
data "aws_iam_role" "current" {
  name = "LabRole"
}