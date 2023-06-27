data "kubectl_path_documents" "kubernetes-manifests" {
    pattern = "./Modules/${var.name_service}/deployment/*.yaml"
    vars = {
        docker_image_ecr = "${aws_ecr_repository.ecr_repo.repository_url}"
        FRONTEND_ADDR    = "frontend:80"
        STATUSCODE       = "200"
    }
    depends_on = [docker_registry_image.subir_image_microservicio]
}

resource "kubectl_manifest" "aplicar_kubernetes_manifests" {
    # "kubectl apply -f ./Modules/${var.name_service}/deployment/*.yaml"
    # Se usa la función fileset para obtener un recuento de la cantidad de archivos, ya que la documentación oficial falla
    count      = length(fileset("./Modules/${var.name_service}/deployment/", "*.yaml"))
    yaml_body  = element(data.kubectl_path_documents.kubernetes-manifests.documents, count.index)
    depends_on = [data.kubectl_path_documents.kubernetes-manifests]
}