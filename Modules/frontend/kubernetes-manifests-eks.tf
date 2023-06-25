resource "null_resource" "update_kubeconfig_aws" {
    triggers = {
      # Función de marca de tiempo para el local-exec
      always_run = "${timestamp()}"
    }

    depends_on = [var.name-eks-cluster]

    provisioner "local-exec" {
      command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster && sleep 60"  # para que se ejecute al minuto de crear los nodos, ya que el cluster demora como 10 minutos
    }
    
}

data "kubectl_path_documents" "kubernetes-manifests" {
    pattern = "./Modules/${var.name_service}/deployment/*.yaml"
    vars = {
        docker_image_ecr = "${aws_ecr_repository.ecr_repo.repository_url}:${var.tag}"
    }
    
    depends_on = [null_resource.update_kubeconfig_aws]
}

resource "kubectl_manifest" "aplicar_kubernetes_manifests" {
    # "kubectl apply -f ./Modules/${var.name_service}/deployment/*.yaml"
    # Se usa la función fileset para obtener un recuento de la cantidad de archivos, ya que la documentación oficial falla
    count      = length(fileset("./Modules/${var.name_service}/deployment/", "*.yaml"))
    yaml_body  = element(data.kubectl_path_documents.kubernetes-manifests.documents, count.index)
    
    depends_on = [null_resource.update_kubeconfig_aws]
}