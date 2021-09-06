#===============CRIAÇÃO DA INTERNET GATEWAY===============#
# As instancias na Subnet pública poderão se comunicar (incoming e outgoing).

resource "aws_internet_gateway" "igw-vdep" {
  vpc_id = aws_vpc.eks-vpc-vdep.id //*Requisito desafio2
  tags = {
    Name = "igw-vdep"
  }

}