# Variables generales

variable "ami" {
  description = "Variable para la imagen de máquina de Amazon (AMI)"
  default = "ami-02396cdd13e9a1257"
  type = string
}

variable "instance_type" {
  description = "Variable para el tipo de instancia"
  default = "t2.micro"
  type = string
}

variable "key_name" {
  description = "Variable para la clave"
  default = "vockey"
  type = string
}

variable "region" {
  description = "Variable para la región de AWS"
  default = "us-east-1"
}

# variable "profile" {
#   description = "Variable para el perfil"
#   default = "us-east-1"
#   type = string
# }

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