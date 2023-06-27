# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

module "adservice" {
  source = "./Modules/adservice"
}

module "cartservice" {
  source = "./Modules/cartservice"
}

module "checkoutservice" {
  source = "./Modules/checkoutservice"
}

module "currencyservice" {
  source = "./Modules/currencyservice"
}

module "emailservice" {
  source = "./Modules/emailservice"
}

module "frontend" {
  source = "./Modules/frontend"
}

module "loadgenerator" {
  source = "./Modules/loadgenerator"
}

module "paymentservice" {
  source = "./Modules/paymentservice"
}

module "productcatalogservice" {
  source = "./Modules/productcatalogservice"
}

module "recommendationservice" {
  source = "./Modules/recommendationservice"
}

module "shippingservice" {
  source = "./Modules/shippingservice"
}

module "redis" {
  source = "./Modules/redis"
}