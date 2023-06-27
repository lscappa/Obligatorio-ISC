# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

module "adservice" {
  source = "./Modules/adservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "cartservice" {
  source = "./Modules/cartservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "checkoutservice" {
  source = "./Modules/checkoutservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "currencyservice" {
  source = "./Modules/currencyservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "emailservice" {
  source = "./Modules/emailservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "frontend" {
  source = "./Modules/frontend"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "loadgenerator" {
  source = "./Modules/loadgenerator"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "paymentservice" {
  source = "./Modules/paymentservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "productcatalogservice" {
  source = "./Modules/productcatalogservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "recommendationservice" {
  source = "./Modules/recommendationservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "shippingservice" {
  source = "./Modules/shippingservice"
  depends_on = [aws_eks_node_group.node_group_services]
}

module "redis" {
  source = "./Modules/redis"
  depends_on = [aws_eks_node_group.node_group_services]
}