#===============CRIAÇÃO DO DATABASE RDS===============#

resource "aws_db_subnet_group" "db_subnet-vdep" {
  name       = "db_subnet-vdep"
  subnet_ids = [aws_subnet.Subnet-DB-1A-vdep.id, aws_subnet.Subnet-DB-1C-vdep.id]

  tags = {
    Name = "db_subnet-vdep"
  }
}

resource "aws_db_instance" "cadastro" {
  allocated_storage      = 10
  max_allocated_storage  = 50
  engine                 = "mysql"
  engine_version         = "8.0.23"
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet-vdep.id
  vpc_security_group_ids = [aws_security_group.RDS-SG-vdep.id, aws_vpc.eks-vpc-vdep.default_security_group_id]
  identifier             = "cadastro" //restringe sempre ao mesmo endpoint
  tags = {
    Name = "db-vdep"
  }
}