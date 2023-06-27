# Configuración del clúster

resource "aws_eks_cluster" "eks-cluster" {
    name        = "eks-cluster"                                 #Nombre del clúster
    version     = "1.27"                                        #Versión de Kubernetes
    
    role_arn    = data.aws_iam_role.current.arn                 #Rol de servicio de clúster

    #Red del clúster asociada a la subred y grupo de seguridad creado
    vpc_config {
        subnet_ids              = ["${aws_subnet.services-private-subnet.id}", "${aws_subnet.services-private-subnet-2.id}"]
        security_group_ids      = ["${aws_security_group.services-sg.id}"]
        endpoint_private_access = true
        endpoint_public_access  = true
    }

    #Etiqueta de recursos con el nombre del clúster
    tags = {
        Name = "eks-cluster"
    }
}


# Configuración del node group

resource "aws_eks_node_group" "node_group_services" {
    cluster_name    = aws_eks_cluster.eks-cluster.name          #Nombre del clúster a asociar el node group
    node_group_name = "node_group_services"                     #Nombre del node group
    
    node_role_arn   = data.aws_iam_role.current.arn             #Rol de IAM de nodo
    
    #Red del node group
    subnet_ids              = ["${aws_subnet.services-private-subnet.id}", "${aws_subnet.services-private-subnet-2.id}"]
    
    #Configuración del node group
    # ami_type       = "AL2_x86_64"                               #Tipo de AMI
    instance_types = ["${var.instance_type}"]                   #Tipos de instancias para la cantidad de pods necesarios a levantar con la cantidad max de ip
    # capacity_type  = "ON_DEMAND"                                #Tipo de capacidad
    # disk_size      = 20                                         #Tamaño del disco


    #Parámetros para el Auto-scaling group
    scaling_config {
        desired_size = 2
        min_size     = 1
        max_size     = 3
    }

    #Etiqueta de recursos con el nombre del node group
    tags = {
        Name = "node_group_services"
    }

}


# Actualizar archivo local "~/.kube/config"

resource "null_resource" "update_kubeconfig_aws" {
    triggers = {
      # Función de marca de tiempo para el local-exec
      always_run = "${timestamp()}"
    }

    #Para ejecutar despues de la creación del cluster
    depends_on = [data.aws_eks_cluster.eks-cluster]

    provisioner "local-exec" {
      command = "aws eks update-kubeconfig --region ${var.region} --name eks-cluster"
    }
}