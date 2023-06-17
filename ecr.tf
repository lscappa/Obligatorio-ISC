resource "aws_ecr_repository" "repositorio_imagenes" {
  name = "repositorio_imagenes"
}

# resource "aws_ecr_repository_policy" "repositorio_policy" {
#   repository = aws_ecr_repository.repositorio.name
#   policy     = data.aws_iam_policy_document.repositorio_policy.json
# }

data "aws_ecr_image" "image_emailservice" {
    repository_name = aws_ecr_repository.repositorio_imagenes.name
    #image_tag       = "1.0"
    #image_digest    = docker_image.repositorio_imagenes.digest
    image_tag       = docker_image.image_emailservice.name
    #image_digest    = docker_image.image_emailservice.digest
}
