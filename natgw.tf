#===============CRIAÇÃO DO NATGATEWAY===============#
# Alocando Elastip IP (um IP externo fixo que nunca muda)

resource "aws_nat_gateway" "natgw-1A-vdep" {
  allocation_id = aws_eip.elastic-ip1A-vdep.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "natgw-vdep1A"
  }
}

resource "aws_nat_gateway" "natgw-1C-vdep" {
  allocation_id = aws_eip.elastic-ip1C-vdep.id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "natgw-vdep1C"
  }
}