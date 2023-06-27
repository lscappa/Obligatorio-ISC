# Variables para el modulo

variable "region" {
  description = "Variable para la región de AWS"
  default = "us-east-1"
}

variable "name_service" {
  description = "Variable con nombre del microservicio"
  default = "frontend"
}

variable "tag" {
  description = "Variable para la etiqueta del microservicio"
  default = "v1"
}

variable "ejecucion_docker_image" {
  description = "Variables relacionadas con la construcción de la imagen de Docker"
  type = bool
  default = false     #false para evitar la ejecución siempre de los bloques o true para ejecutarlo
}

# variable "eks-cluster-node-group" { }

# variable "eks-cluster" { }