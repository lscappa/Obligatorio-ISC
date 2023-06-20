# Configuración de repositorio en AWS ECR, creación de imagen mediante Dockerfile y subida al repositorio creado

# Creo el repositorio de imagenes en AWS ECR
resource "aws_ecr_repository" "ecr_repo" {
  name = "image_${var.name_service}"
}

# Conexión con AWS ECR mediante autenticación
resource "null_resource" "docker_login_aws" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr_repo.repository_url}"
  }
}

# Creación de imagen de Docker para el microservicio paymentservice mediante el Dockerfile
resource "docker_image" "image_microservicio" {
  name = "image_${var.name_service}:${var.tag}"
  build {
    context     = "./Modules/${var.name_service}/src/"
    dockerfile  = "Dockerfile"
  }

  # Se etiqueta la imagen para poder enviarla al repositorio
  provisioner "local-exec" {
    command = "docker tag ${docker_image.image_microservicio.name} ${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}"
  }

  # Se sube la imagen al repositorio de Amazon ECR
  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}"
  }

  # Se elimina la imagen local para no conservarla localmente después de hacer push
  provisioner "local-exec" {
    command = "docker rmi ${aws_ecr_repository.ecr_repo.repository_url}:${var.tag} && docker rmi image_${var.name_service}:${var.tag}"
  }

  # Dependencia de la autenticación en AWS ECR para antes de construir y subir la imagen
  depends_on = [null_resource.docker_login_aws]
}