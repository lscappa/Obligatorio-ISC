# Variables para el modulo

variable "region" {
  description = "Variable para la región de AWS"
  default = "us-east-1"
}

variable "name_service" {
  description = "Variable con nombre del microservicio"
  default = "redis"
}

variable "eks-cluster-node-group" { }

variable "eks-cluster" { }