# Recursos de AWS necesarios para invocar los módulos (micro-servicios)

# module "deploy-instance-adservice" {
#     source = "./modules/adservice"
#     count = 1

#     ami = var.ami
#     instance_type = var.instance_type
#     key_name      = var.key_name
#     #region = var.region
#     #sg-id = "sg-xxxxx"

#     tags = {
#         Name = "instance-adservice"
#     }
# }

module "adservice" {
  source = "./Modules/adservice"
}

module "cartservice" {
  source = "./Modules/cartservice/src"
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