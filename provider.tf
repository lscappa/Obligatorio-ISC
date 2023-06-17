# Configuracion AWS Provider
provider "aws" {
    # shared_config_files       = ["/home/lali/.aws/config"]
    # shared_credentials_files  = ["/home/lali/.aws/credentials"]
    shared_config_files         = ["C:/Users/vale/.aws/config"]
    shared_credentials_files    = ["C:/Users/vale/.aws/credentials"]
    region = var.region         //declarada en variables
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
provider "docker" {
    #version = "~> 3.0.2"
    host = "unix:///var/run/docker.sock"
}