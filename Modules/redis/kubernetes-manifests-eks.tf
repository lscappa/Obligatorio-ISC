resource "null_resource" "update_kubeconfig_aws" {
    triggers = {
      # Función de marca de tiempo para el local-exec
      always_run = "${timestamp()}"
    }

    #Para ejecutar despues de la creación del cluster y los nodos
    # depends_on = [var.eks-cluster-node-group]

    provisioner "local-exec" {
      command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
    }
    
}

data "kubectl_path_documents" "kubernetes-manifests" {
    pattern = "./Modules/${var.name_service}/deployment/*.yaml"
    
    depends_on = [kubectl_path_documents.kubernetes-manifests]
}

resource "kubectl_manifest" "aplicar_kubernetes_manifests" {
    # "kubectl apply -f ./Modules/${var.name_service}/deployment/*.yaml"
    # Se usa la función fileset para obtener un recuento de la cantidad de archivos, ya que la documentación oficial falla
    count      = length(fileset("./Modules/${var.name_service}/deployment/", "*.yaml"))
    yaml_body  = element(data.kubectl_path_documents.kubernetes-manifests.documents, count.index)
    
    depends_on = [kubectl_path_documents.kubernetes-manifests]
}