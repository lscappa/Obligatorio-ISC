# Configuracion AWS VPC, subnet, gateway y route table

# Configuración de VPC
resource "aws_vpc" "services-vpc" {
  cidr_block              = var.vpc_cidr_block        ##Bloque cidr pasado por variable.
  enable_dns_support      = true
  enable_dns_hostnames    = true

  tags = {
    Name = "services-vpc"
  }
}

# Configuración de subred privada asociada al VPC creado en una zona de disponibilidad
resource "aws_subnet" "services-private-subnet" {
  vpc_id                  = aws_vpc.services-vpc.id   
  cidr_block              = var.private_subnet        ##subred privada pasado por variable.
  availability_zone       = var.vpc_aws_az            ##zona de disponibilidad pasado por variable.
  map_public_ip_on_launch = "true"
  tags = {
    Name = "services-private-subnet"
  }
}

# Configuración de subred privada 2 asociada al VPC creado en otra zona de disponibilidad
resource "aws_subnet" "services-private-subnet-2" {
  vpc_id                  = aws_vpc.services-vpc.id
  cidr_block              = var.private_subnet-2      ##subred privada pasado por variable.
  availability_zone       = var.vpc_aws_az-2          ##zona de disponibilidad pasado por variable.
  map_public_ip_on_launch = "true"
  tags = {
    Name = "services-private-subnet-2"
  }
}

# Configuración de internet gateway asociada al VPC
resource "aws_internet_gateway" "services-gw" {
  vpc_id                  = aws_vpc.services-vpc.id
  tags = {
    Name = "services-gw"
  }
}

# Configuración de tabla de enrutamiento asociada al VPC y la ruta al internet gateway
resource "aws_default_route_table" "services-route-table" {
  default_route_table_id  = aws_vpc.services-vpc.default_route_table_id
  route {
    cidr_block            = "0.0.0.0/0"
    gateway_id            = aws_internet_gateway.services-gw.id
  }
  tags = {
    Name = "default-route-table"
  }
}
