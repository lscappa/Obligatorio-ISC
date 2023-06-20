# Configuración de repositorio en AWS ECR, creación de imagen mediante Dockerfile y subida al repositorio creado

# Creo el repositorio de imagenes en AWS ECR
resource "aws_ecr_repository" "image_paymentservice" {
  name = "image_paymentservice"
}

# Conexión con AWS ECR mediante autenticación
resource "null_resource" "docker_login_aws" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.image_paymentservice.repository_url}"
  }
}

# Creación de imagen de Docker para el microservicio paymentservice mediante el Dockerfile
resource "docker_image" "image_paymentservice" {
  name = "image_paymentservice:v1"
  build {
    context    = "./Modules/paymentservice/"
    dockerfile  = "Dockerfile"
  }

  # Se etiqueta la imagen para poder enviarla al repositorio
  provisioner "local-exec" {
    command = "docker tag ${docker_image.image_paymentservice.name} ${aws_ecr_repository.image_paymentservice.repository_url}:v1"
  }

  # Se sube la imagen al repositorio de Amazon ECR
  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.image_paymentservice.repository_url}:v1"
  }

  # Se elimina la imagen local para no conservarla localmente después de hacer push
  provisioner "local-exec" {
    command = "docker rmi ${aws_ecr_repository.image_paymentservice.repository_url}:v1 && docker rmi image_paymentservice:v1"
  }

  # Dependencia de la autenticación en AWS ECR para antes de construir y subir la imagen
  depends_on = [null_resource.docker_login_aws]
}


#       aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.image_paymentservice.repository_url}
#       aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 844508465648.dkr.ecr.us-east-1.amazonaws.com
#
#       docker tag ${docker_image.image_paymentservice.name} ${aws_ecr_repository.image_paymentservice.repository_url}:production
#       docker tag image_paymentservice:production 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_paymentservice:production
#
#       docker push ${aws_ecr_repository.image_paymentservice.repository_url}:${docker_image.image_paymentservice.name}
#       docker push 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_paymentservice:production