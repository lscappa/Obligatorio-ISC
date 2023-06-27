# resource "null_resource" "update_kubeconfig_aws" {
#     triggers = {
#       # Función de marca de tiempo para el local-exec
#       always_run = "${timestamp()}"
#     }

#     #Para ejecutar despues de la creación del cluster
#     depends_on = [aws_eks_cluster.eks-cluster]

#     provisioner "local-exec" {
#       command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
#     }
    
# }