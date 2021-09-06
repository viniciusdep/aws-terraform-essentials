#===============CRIAÇÃO DE ELASTIC IPS===============#
# Forçando um IP fixo 

resource "aws_eip" "elastic-ip1A-vdep" {
  depends_on = [aws_internet_gateway.igw-vdep]
  tags = {
    Name = "elastic-ip1A-vdep"
  }
}

resource "aws_eip" "elastic-ip1C-vdep" {
  depends_on = [aws_internet_gateway.igw-vdep]
  tags = {
    Name = "elastic-ip1C-vdep"
  }
}