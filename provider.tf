provider "aws" {
    shared_config_files = ["/home/lali/.aws/config"]
    shared_credentials_files = ["/home/lali/.aws/credentials"]
    region = var.region     //declarada en variables
}