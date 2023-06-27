# Configuracion AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
  }
}

provider "aws" {
    shared_config_files        = [var.shared_config_files]
    shared_credentials_files   = [var.shared_credentials_files]
    region = var.region         //declaradas en variables
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-cluster.token
  load_config_file       = false
  apply_retry_count      = 10
}