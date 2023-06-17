resource "aws_ecr_repository" "repositorio" {
  name = "repositorio"
}

# resource "aws_ecr_repository_policy" "repositorio_policy" {
#   repository = aws_ecr_repository.repositorio.name
#   policy     = data.aws_iam_policy_document.repositorio_policy.json
# }

data "aws_ecr_image" "repositorio_imagenes" {
  repository_name = aws_ecr_repository.repositorio.name
  image_tag       = "1.0"
  #image_digest    = docker_image.repositorio_imagenes.digest
}
