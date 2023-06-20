# Configuración de repositorio en AWS ECR, creación de imagen mediante Dockerfile y subida al repositorio creado

# Creo el repositorio de imagenes en AWS ECR
resource "aws_ecr_repository" "image_emailservice" {
  name = "image_emailservice"
}

# Conexión con AWS ECR mediante autenticación
resource "null_resource" "docker_login_aws" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.image_emailservice.repository_url}"
  }
}

# Creación de imagen de Docker para el microservicio emailservice mediante el Dockerfile
resource "docker_image" "image_emailservice" {
  name = "image_emailservice:v1"
  build {
    context    = "./Modules/emailservice/"
    dockerfile  = "Dockerfile"
  }

  # Se etiqueta la imagen para poder enviarla al repositorio
  provisioner "local-exec" {
    command = "docker tag ${docker_image.image_emailservice.name} ${aws_ecr_repository.image_emailservice.repository_url}:v1"
  }

  # Se sube la imagen al repositorio de Amazon ECR
  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.image_emailservice.repository_url}:v1"
  }

  # Se elimina la imagen local para no conservarla localmente después de hacer push
  provisioner "local-exec" {
    command = "docker rmi ${aws_ecr_repository.image_emailservice.repository_url}:v1 && docker rmi image_emailservice:v1"
  }

  # Dependencia de la autenticación en AWS ECR para antes de construir y subir la imagen
  depends_on = [null_resource.docker_login_aws]
}


#       aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.image_emailservice.repository_url}
#       aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 844508465648.dkr.ecr.us-east-1.amazonaws.com
#
#       docker tag ${docker_image.image_emailservice.name} ${aws_ecr_repository.image_emailservice.repository_url}:production
#       docker tag image_emailservice:production 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_emailservice:production
#
#       docker push ${aws_ecr_repository.image_emailservice.repository_url}:${docker_image.image_emailservice.name}
#       docker push 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_emailservice:production