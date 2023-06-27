# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

module "adservice" {
  source = "./Modules/adservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "cartservice" {
  source = "./Modules/cartservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "checkoutservice" {
  source = "./Modules/checkoutservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "currencyservice" {
  source = "./Modules/currencyservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "emailservice" {
  source = "./Modules/emailservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "frontend" {
  source = "./Modules/frontend"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "loadgenerator" {
  source = "./Modules/loadgenerator"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "paymentservice" {
  source = "./Modules/paymentservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "productcatalogservice" {
  source = "./Modules/productcatalogservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "recommendationservice" {
  source = "./Modules/recommendationservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "shippingservice" {
  source = "./Modules/shippingservice"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}

module "redis" {
  source = "./Modules/redis"
  eks-cluster-node-group = aws_eks_node_group.node_group_services
  eks-cluster = aws_eks_cluster.eks-cluster
}