# resource "null_resource" "update_kubeconfig_aws" {
#   provisioner "local-exec" {
#     command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
#   }
# }

data "kubectl_path_documents" "kubernetes-manifests" {
    pattern = "./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
    vars = {
        docker_image_ecr = "${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}"
    }
    # depends_on = [null_resource.update_kubeconfig_aws]
}

resource "kubectl_manifest" "aplicar_kubernetes_manifests" {
    # "kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
    for_each  = toset(data.kubectl_path_documents.kubernetes-manifests.documents)
    yaml_body = each.value
    # depends_on = [null_resource.update_kubeconfig_aws]
}

