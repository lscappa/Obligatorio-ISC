# Configuracion AWS Security Group

# Se configura el grupo de seguridad asociado al VPC con las reglas de entrada y salida para los puertos y protocolos correspondientes
resource "aws_security_group" "services-sg" {
  name   = "services-sg"
  vpc_id = aws_vpc.services-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "services-sg"
  }
}