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

# resource "null_resource" "subir_imagen" {
#   depends_on = [docker_image.image_emailservice]

#   provisioner "local-exec" {
#     command = <<-EOT
#       aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.repositorio_imagenes.repository_url}
#       docker tag ${docker_image.image_emailservice.name}:production ${aws_ecr_repository.repositorio_imagenes.repository_url}:${docker_image.image_emailservice.name}
#       docker push ${aws_ecr_repository.repositorio_imagenes.repository_url}:${docker_image.image_emailservice.name}
#     EOT
#     interpreter = ["bash", "-c"]
#   }
# }

resource "null_resource" "subir_imagen" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 844508465648.dkr.ecr.us-east-1.amazonaws.com
      docker tag image_emailservice:production 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_emailservice:production
      docker push 844508465648.dkr.ecr.us-east-1.amazonaws.com/image_emailservice:production
    EOT
  }
  depends_on = [docker_image.image_emailservice]
}

