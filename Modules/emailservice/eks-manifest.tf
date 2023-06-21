resource "null_resource" "update_kubeconfig_aws" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
  }
}

resource "null_resource" "aplicar_kubernetes_manifests" {
  depends_on = [null_resource.update_kubeconfig_aws]

  provisioner "local-exec" {
    command = "kubectl apply -f ./Modules/${var.name_service}/deployment/kubernetes-manifests.yaml"
  }
}