# Creación de imagenes 

# resource "docker_image" "image_adservice" {
#     name          = "image_adservice:1.0"
#     build         = {
#         context    = "./Modules/adservice"
#         dockerfile = "./Modules/adservice/Dockerfile"
#     }
# }

# resource "docker_image" "image_adservice" {
#   name = "image_adservice:1.0"
#   build {
#     context = "Modules/adservice"
#     tag     = ["image_adservice:develop"]
#     build_arg = {
#       foo : "image_adservice"
#     }
#     label = {
#       author : "image_adservice"
#     }
#   }
# }