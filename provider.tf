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

provider "aws" {
    shared_config_files        = [var.shared_config_files]
    shared_credentials_files   = [var.shared_credentials_files]
    region = var.region         //declaradas en variables
}

provider "docker" {
  registry_auth {
    #address  = local.aws_ecr_url
    address  = data.aws_ecr_authorization_token.ecr_auth_token.proxy_endpoint
    username = data.aws_ecr_authorization_token.ecr_auth_token.user_name
    password = data.aws_ecr_authorization_token.ecr_auth_token.password
  }
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks-cluster.token
  load_config_file       = false
  apply_retry_count      = 10
}