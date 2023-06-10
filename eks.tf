module "eks_managed_node_groups" {
    source  = "./modules/eks-managed-node-group"

    #one {
    name = "node-group-1"
    cluster_name   = "my-cluster"

    subnet_ids     = ["services-private-subnet", "services-private-subnet-2"]

    instance_types = ["t2.micro"]
    capacity_type  = "SPOT"

    min_size     = 1
    max_size     = 3
    desired_size = 2
    #}

    # two = {
    #     name = "node-group-2"

    #     instance_types = ["t2.micro"]

    #     min_size     = 1
    #     max_size     = 2
    #     desired_size = 1
    # }
}