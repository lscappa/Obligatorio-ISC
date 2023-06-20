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

module "emailservice" {
  source = "./Modules/emailservice"
}

module "paymentservice" {
  source = "./Modules/paymentservice"
}