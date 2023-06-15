resource "aws_eks_cluster" "eks-cluster-pruebi" {
    name        = "eks-cluster-pruebi"
    version     = "1.27"  #Versión de Kubernetes
    
    role_arn    = "arn:aws:iam::397031304952:role/LabRole"

    vpc_config {
        subnet_ids = ["subnet-0c4edfdfd5d2bec31", "subnet-09141a1130df26118"]
        security_group_ids      = ["sg-018afb4ce3f0d8ccc"]
        endpoint_private_access = true
        endpoint_public_access  = true
    }

    tags = {
        Name = "eks-cluster-pruebi"
    }

}

resource "aws_eks_node_group" "my_node_group_1" {
    cluster_name    = aws_eks_cluster.eks-cluster-pruebi.name
    node_group_name = "my_node_group_1"
    
    node_role_arn   = "arn:aws:iam::397031304952:role/LabRole"
    
    subnet_ids      = ["subnet-0c4edfdfd5d2bec31", "subnet-09141a1130df26118"]

    scaling_config {
        desired_size = 2
        min_size     = 1
        max_size     = 3
    }

    tags = {
        Name = "my_node_group_1"
    }

    # ami_type       = "AL2_x86_64"
    instance_types = ["t2.micro"]
    # capacity_type  = "ON_DEMAND"
    # disk_size      = 20
}

# resource "aws_eks_node_group" "my_node_group_2" {
#     cluster_name    = aws_eks_cluster.eks-cluster-pruebi.name
#     node_group_name = "my_node_group_2"
    
#     node_role_arn   = "arn:aws:iam::397031304952:role/LabRole"
    
#     subnet_ids      = ["subnet-0c4edfdfd5d2bec31", "subnet-09141a1130df26118"]

#     scaling_config {
#         desired_size = 2
#         min_size     = 1
#         max_size     = 3
#     }

#     tags = {
#         Name = "my_node_group_2"
#     }

#     # ami_type       = "AL2_x86_64"
#     instance_types = ["t2.micro"]
#     # capacity_type  = "ON_DEMAND"
#     # disk_size      = 20
# }