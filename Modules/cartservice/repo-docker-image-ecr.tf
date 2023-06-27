# Configuración de repositorio en AWS ECR, creación de imagen mediante Dockerfile y subida al repositorio creado

# Creo el repositorio de imagenes en AWS ECR
resource "aws_ecr_repository" "ecr_repo" {
  force_delete = "true"
  name = "${var.name_service}"
}

# Conexión con AWS ECR mediante autenticación
resource "null_resource" "docker_login_aws" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr_repo.repository_url}"
  }
}

# Creación de imagen de Docker para el microservicio mediante el Dockerfile
resource "docker_image" "image_microservicio" {
  name         = "${aws_ecr_repository.ecr_repo.repository_url}"
  build        {
    context    = "./Modules/${var.name_service}/src/"
    dockerfile  = "Dockerfile"
  }
  depends_on = [null_resource.docker_login_aws]
}

# Se sube la imagen al repositorio de Amazon ECR
resource "docker_registry_image" "subir_image_microservicio" {
  name = "${aws_ecr_repository.ecr_repo.repository_url}"

  # Dependencia de la autenticación en AWS ECR para antes de subir la imagen
  depends_on = [docker_image.image_microservicio, null_resource.docker_login_aws]
}