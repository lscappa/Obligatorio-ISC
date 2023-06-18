# Creación de imagenes 

# resource "docker_image" "image_emailservice" {
#     name          = "image_emailservice"
#     build {
#         context    = "./Modules/emailservice/"
#         dockerfile  = "Dockerfile"
#     }
# }

resource "docker_image" "image_emailservice" {
  name = "image_emailservice"
  build {
    context    = "./Modules/emailservice/"
    dockerfile  = "Dockerfile"
    tag     = ["image_emailservice:develop"]
  }
}

# resource "null_resource" "build_image" {
#   provisioner "local-exec" {
#     command = "docker build -t image_ubuntu:1.0 -f ./Modules/emailservice/Dockerfile . "
#     #          docker build -t <tag-name> -f <file-name> .
#   }
# }

# resource "docker_image" "image_ubuntu" {
#   name = "image_ubuntu:1.0"
#   keep_locally = false
#   #force_update = true

#   depends_on = [null_resource.build_image]
# }
