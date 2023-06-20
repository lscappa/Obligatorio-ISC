# Variables para el modulo

variable "region" {
  description = "Variable para la región de AWS"
  default = "us-east-1"
}

variable "name_service" {
  description = "Variable con nombre del microservicio"
  default = "paymentservice"
}

variable "tag" {
  description = "Variable para la etiqueta del microservicio"
  default = "v1"
}