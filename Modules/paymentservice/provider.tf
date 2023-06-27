# Configuracion AWS Provider, Docker Provider, Kubectl Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    docker = {
      source  = "kreuzwerker/docker"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
    }  
  }
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-cluster.token
  load_config_file       = false
  apply_retry_count      = 10
}

# provider "docker" {
#   registry_auth {
#     address  = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
#     username = data.aws_ecr_authorization_token.token.user_name
#     password = data.aws_ecr_authorization_token.token.password
#   }
# }