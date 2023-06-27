# Variables de salida

# Obtener el ID de la cuenta actual
output "Consulta-account_id" {
  description = "ID de la cuenta actual"
  value = data.aws_caller_identity.current.account_id
}

# Obtener el ARN del rol IAM
output "Consulta-role_ARN" {
  description = "ARN del rol IAM"
  value = data.aws_iam_role.current.arn
}

output "Consulta-Cluster-EKS" {
  description = "Cluster EKS"
  value = data.aws_eks_cluster.eks-cluster.name
}

output "Consulta-Estado-del-Cluster-EKS" {
  description = "Estado del Cluster EKS"
  value = data.aws_eks_cluster.eks-cluster.status
}

output "Punto-de-enlace-del-Cluster" {
  description = "Punto de enlace del servidor de la API (endpoint)"
  value = data.aws_eks_cluster.eks-cluster.endpoint
}

output "Consulta-url-endpoint-aws-ecr" {
  value = data.aws_ecr_authorization_token.ecr_auth_token.proxy_endpoint
}