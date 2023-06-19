# resource "kubernetes_manifest" "emailservice" {
#     #manifest = file("./Modules/emailservice/deployment/kubernetes-manifests.yaml")
#     manifest = file("${path.module}/Modules/emailservice/deployment/kubernetes-manifests.yaml")
#     #content = file("./Modules/emailservice/deployment/kubernetes-manifests.yaml")
# }

# locals {
#   emailservice_manifest = file("./Modules/emailservice/deployment/kubernetes-manifests.yaml")
# }

# resource "kubernetes_manifest" "emailservice" {
#   manifest = local.emailservice_manifest
# }

# resource "kubernetes_manifest" "emailservice" {
#   manifest = file("kubernetes-manifests.yaml")
# }
