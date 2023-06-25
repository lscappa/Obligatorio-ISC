# Configuracion AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
    shared_config_files        = [var.shared_config_files]
    shared_credentials_files   = [var.shared_credentials_files]
    region = var.region         //declaradas en variables
}