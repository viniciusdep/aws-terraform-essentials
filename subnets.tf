resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.eks-vpc-vdep.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name                                     = "public-us-east-1a"
    "kubernetes.io/cluster/eks-cluster-vdep" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.eks-vpc-vdep.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name                                     = "public-us-east-1c"
    "kubernetes.io/cluster/eks-cluster-vdep" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.eks-vpc-vdep.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name                                     = "private-us-east-1a"
    "kubernetes.io/cluster/eks-cluster-vdep" = "shared"
    "kubernetes.io/role/internal-elb"        = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.eks-vpc-vdep.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name                                     = "private-us-east-1c"
    "kubernetes.io/cluster/eks-cluster-vdep" = "shared"
    "kubernetes.io/role/internal-elb"        = 1
  }
}

resource "aws_subnet" "Subnet-DB-1A-vdep" {
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.eks-vpc-vdep.id
  cidr_block        = "10.0.6.0/24"

  tags = {
    Name = "Subnet-DB-1A-vdep"
  }

}

resource "aws_subnet" "Subnet-DB-1C-vdep" {
  availability_zone = "us-east-1c"
  vpc_id            = aws_vpc.eks-vpc-vdep.id
  cidr_block        = "10.0.7.0/24"

  tags = {
    Name = "Subnet-DB-1C-vdep"
  }

}
