# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

module "adservice" {
  source = "./Modules/adservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "cartservice" {
  source = "./Modules/cartservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "checkoutservice" {
  source = "./Modules/checkoutservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "currencyservice" {
  source = "./Modules/currencyservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "emailservice" {
  source = "./Modules/emailservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "frontend" {
  source = "./Modules/frontend"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "loadgenerator" {
  source = "./Modules/loadgenerator"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "paymentservice" {
  source = "./Modules/paymentservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "productcatalogservice" {
  source = "./Modules/productcatalogservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "recommendationservice" {
  source = "./Modules/recommendationservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "shippingservice" {
  source = "./Modules/shippingservice"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}

module "redis" {
  source = "./Modules/redis"
  # eks-cluster-node-group = aws_eks_node_group.node_group_services
  # eks-cluster = aws_eks_cluster.eks-cluster
  depends_on = [aws_eks_node_group.node_group_services]
}