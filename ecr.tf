resource "aws_ecr_repository" "repositorio_imagenes" {
  name = "repositorio_imagenes"
}

# resource "aws_ecr_repository_policy" "repositorio_policy" {
#   repository = aws_ecr_repository.repositorio.name
#   policy     = data.aws_iam_policy_document.repositorio_policy.json
# }

# data "aws_ecr_image" "image_emailservice" {
#     repository_name = aws_ecr_repository.repositorio_imagenes.name
#     #image_tag       = "1.0"
#     #image_digest    = docker_image.repositorio_imagenes.digest
#     image_tag       = docker_image.image_emailservice.name
#     #image_digest    = docker_image.image_emailservice.digest
# }

# data "aws_ecr_image" "image_centos" {
#     repository_name = aws_ecr_repository.repositorio_imagenes.name
#     #image_tag       = "1.0"
#     #image_digest    = docker_image.repositorio_imagenes.digest
#     image_tag       = docker_image.image_centos.name
#     #image_digest    = docker_image.centos.digest
# }

resource "null_resource" "push_image" {
  depends_on = [docker_image.image_emailservice]

  provisioner "local-exec" {
    command = <<-EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.image_repository.repository_url}
      docker tag ${docker_image.image_emailservice.name} ${aws_ecr_repository.image_repository.repository_url}:${docker_image.image_emailservice.name}
      docker push ${aws_ecr_repository.image_repository.repository_url}:${docker_image.image_emailservice.name}
    EOT
    interpreter = ["bash", "-c"]
  }
}
