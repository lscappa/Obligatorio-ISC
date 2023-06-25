# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

module "adservice" {
  source = "./Modules/adservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "cartservice" {
  source = "./Modules/cartservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "checkoutservice" {
  source = "./Modules/checkoutservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "currencyservice" {
  source = "./Modules/currencyservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "emailservice" {
  source = "./Modules/emailservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "frontend" {
  source = "./Modules/frontend"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "loadgenerator" {
  source = "./Modules/loadgenerator"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "paymentservice" {
  source = "./Modules/paymentservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "productcatalogservice" {
  source = "./Modules/productcatalogservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "recommendationservice" {
  source = "./Modules/recommendationservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "shippingservice" {
  source = "./Modules/shippingservice"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}

module "redis" {
  source = "./Modules/redis"
  name-eks-cluster = aws_eks_cluster.eks-cluster
}