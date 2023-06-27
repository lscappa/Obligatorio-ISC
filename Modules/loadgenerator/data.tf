# data "aws_eks_cluster" "eks-cluster" {
#   name = "eks-cluster"
#   depends_on = [var.eks-cluster]
# }

# data "aws_eks_cluster_auth" "eks-cluster" {
#   name = "eks-cluster"
#   depends_on = [var.eks-cluster]
# }