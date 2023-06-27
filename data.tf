# Consultar la identidad actual
data "aws_caller_identity" "current" {}

# Consultar información del rol IAM
data "aws_iam_role" "current" {
  name = "LabRole"
}

# Consultar el cluster y la autenticación para pasarlo la conexión de provider una vez creado
data "aws_eks_cluster" "eks-cluster" {
  name = "eks-cluster"
  depends_on = [aws_eks_cluster.eks-cluster]
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name = "eks-cluster"
  depends_on = [aws_eks_cluster.eks-cluster]
}

# Consultar Autorización de token AWS ECR
data "aws_ecr_authorization_token" "ecr_auth_token" {}

locals {
  aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}

output "Consulta-aws-ecr-url" {
  value = local.aws_ecr_url
}