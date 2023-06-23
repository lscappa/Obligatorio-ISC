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

# provider "docker" {
#   registry_auth {
#     address  = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
#     username = data.aws_ecr_authorization_token.token.user_name
#     password = data.aws_ecr_authorization_token.token.password
#   }
# }