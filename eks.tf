resource "aws_eks_cluster" "eks-cluster" {
    name        = "eks-cluster"
    version     = "1.27"  #Versión de Kubernetes
    
    role_arn    = "arn:aws:iam::844508465648:role/LabRole"

    vpc_config {
        #subnet_ids              = [aws_subnet.services-private-subnet.id, aws_subnet.services-private-subnet-2.id]
        subnet_ids              = ["subnet-0573740c09f6cde3c", "subnet-006b89a4bfc27f51b"]
        #security_group_ids      = ["aws_security_group.services-sg.id"]
        security_group_ids      = ["sg-0fc662eb59ba9aa47"]
        endpoint_private_access = true
        endpoint_public_access  = true
    }

    tags = {
        Name = "eks-cluster"
    }

}

resource "aws_eks_node_group" "node_group_services" {
    cluster_name    = aws_eks_cluster.eks-cluster.name
    node_group_name = "node_group_services"
    
    node_role_arn   = "arn:aws:iam::844508465648:role/LabRole"
    
    #subnet_ids              = ["aws_subnet.services-private-subnet.id", "aws_subnet.services-private-subnet-2.id"]
    subnet_ids              = ["subnet-0573740c09f6cde3c", "subnet-006b89a4bfc27f51b"]
    scaling_config {
        desired_size = 2
        min_size     = 1
        max_size     = 3
    }

    tags = {
        Name = "node_group_services"
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