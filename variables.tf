# Variables generales

variable "instance_type" {
  description = "Variable para el tipo de instancia del node group"
  default = "t3.medium"    #t3.medium max 18 ip para pod o t3.large max 36 ip para pods
  type = string
}

variable "region" {
  description = "Variable para la región de AWS"
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "Variable para el bloque CIDR del VPC"
  default = "172.16.0.0/16"
  type = string
}

variable "private_subnet" {
  description = "Variable para la subred privada 1"
  default = "172.16.1.0/24"
}

variable "vpc_aws_az" {
  description = "Variable para la zona de disponibilidad 1"
  default = "us-east-1a"
}

variable "private_subnet-2" {
  description = "Variable para la subred privada 2"
  default = "172.16.2.0/24"
}

variable "vpc_aws_az-2" {
  description = "Variable para la zona de disponibilidad 2"
  default = "us-east-1b"
}

# Variables para conexión del AWS Provider
variable "shared_config_files" {
  default = "C:/Users/vale/.aws/config"
  # default = = "/home/lali/.aws/config"
  # default = "/Users/lscappa/.aws/config"
}

variable "shared_credentials_files" {
  default = "C:/Users/vale/.aws/credentials"
  # default = = "/home/lali/.aws/credentials"
  # default = "/Users/lscappa/.aws/credentials"
}