# # Se implementa la subida de imagen a Docker Hub en vez de aws_ecr_repository ya que al hacer push de la imagen daba error
# # Conexión con Docker Hub mediante autenticación
# resource "null_resource" "docker_login" {
#   provisioner "local-exec" {
#     command = "docker login -u oblicloud -p ObliCloud.2023"
#   }
# }

# # Creación de imagen para el microservicio emailservice mediante el Dockerfile
# resource "docker_image" "image_emailservice" {
#   name = "oblicloud/image_emailservice:production"
#   build {
#     context    = "./Modules/emailservice/"
#     dockerfile  = "Dockerfile"
#     tag     = ["image_emailservice:production"]   #Tag para etiquetar la imagen docker tag oblicloud/image_emailservice:production
#   }

#   # Se sube la imagen al repositorio de Docker Hub
#   provisioner "local-exec" {
#     command = "docker push oblicloud/image_emailservice:production"
#   }

#   # Eliminar la imagen local para no conservarla localmente después de hacer push
#   provisioner "local-exec" {
#     command = "docker rmi oblicloud/image_emailservice:production"
#   }

#   # Dependencia de la autenticación en Docker Hub para antes de construir y subir la imagen
#   depends_on = [null_resource.docker_login]
# }