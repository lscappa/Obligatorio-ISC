# Invocar los módulos

module "deploy-instance-adservice" {
    source = "./modules/adservice"
    count = 1

    ami = var.ami
    instance_type = var.instance_type
    key_name      = var.key_name
    #region = var.region
    #sg-id = "sg-xxxxx"

    tags = {
        Name = "instance-adservice"
    }
}