resource "null_resource" "update_kubeconfig_aws" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
  }
}

# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

#   provisioner "local-exec" {
#     command = "sed -i 's|IMAGE_TAG|$${aws_ecr_repository.ecr_repo.repository_url}:$${var.tag}|g' ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml && kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#   }
# }

# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

#   provisioner "local-exec" {
#     command = "kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#   }
# }

# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

#   provisioner "local-exec" {
#     command = <<-EOF
#       $content = Get-Content -Path "./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml" -Raw
#       $updatedContent = $content -replace "IMAGE_TAG", "${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}"
#       $updatedContent | Set-Content -Path "./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#       kubectl apply -f "./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#     EOF

#     interpreter = ["PowerShell", "-Command"]
#   }
# }

# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

#   provisioner "local-exec" {
#     command = <<-EOF
#       sed -i 's|IMAGE_TAG|${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}|g' ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml
#       kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml
#     EOF

#     interpreter = ["bash", "-c"]
#   }
# }


# resource "null_resource" "aplicar_kubernetes_manifests" {
#   depends_on = [null_resource.update_kubeconfig_aws]

#   provisioner "local-exec" {
#     command = "sed -i 's|IMAGE_TAG|${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}|g' ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#     interpreter = ["bash", "-c"]
#   }
#   provisioner "local-exec" {
#     command = "kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
#   }
# }

resource "null_resource" "aplicar_kubernetes_manifests" {
  depends_on = [null_resource.update_kubeconfig_aws]

  provisioner "local-exec" {
    command = <<-EOF
      sed -i 's|IMAGE_TAG|${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}|g' ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml
      kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml
    EOF

    interpreter = ["bash", "-c"]
  }
}
