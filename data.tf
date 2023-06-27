# Consultar la identidad actual
data "aws_caller_identity" "current" {}

# Consultar información del rol IAM
data "aws_iam_role" "current" {
  name = "LabRole"
}

##############################################3
data "aws_eks_cluster" "eks-cluster" {
  name = "eks-cluster"
  depends_on = [aws_eks_cluster.eks-cluster]
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name = "eks-cluster"
  depends_on = [aws_eks_cluster.eks-cluster]
}

# output "consulta-eks" {
#   value = data.aws_eks_cluster.eks-cluster
# }

# output "consulta-eks-status" {
#   value = data.aws_eks_cluster.eks-cluster.status
# }

# output "consulta-eks-name" {
#   value = data.aws_eks_cluster.eks-cluster.name
# }


# output "endpoint" {
#   value = data.aws_eks_cluster.eks-cluster.endpoint
# }

# output "kubeconfig-certificate-authority-data" {
#   value = data.aws_eks_cluster.eks-cluster.certificate_authority[0].data
# }

# # Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019.
# output "identity-oidc-issuer" {
#   value = data.aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
# }