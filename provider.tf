# Configuracion AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
    # shared_config_files       = ["/home/lali/.aws/config"]
    # shared_credentials_files  = ["/home/lali/.aws/credentials"]
    shared_config_files         = ["C:/Users/vale/.aws/config"]
    shared_credentials_files    = ["C:/Users/vale/.aws/credentials"]
    region = var.region         //declarada en variables
}