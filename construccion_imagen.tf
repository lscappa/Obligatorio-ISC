# Creación de imagenes 

# resource "docker_image" "image_emailservice" {
#     name          = "image_emailservice:1.0"
#     build {
#         context    = "."
#         dockerfile  = "./Modules/emailservice/Dockerfile"
#     }
# }

resource "docker_image" "image_emailservice" {
  name = "image_emailservice"
  build {
    context    = "."
    dockerfile  = "./Modules/emailservice/Dockerfile"
    tag     = ["image_emailservice:develop"]
    build_arg = {
      foo : "image_emailservice"
    }
    label = {
      author : "image_emailservice"
    }
  }
}