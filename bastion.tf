#===============CRIAÇÃO DO BASTION HOST===============#

resource "aws_instance" "bastion-vdep" {

  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.SG-bastion-host-vdep.id]
  associate_public_ip_address = true
  depends_on                  = [aws_db_instance.cadastro]
  key_name                    = "aws-viniciusdep"

  tags = {
    Name = "bastion-host-vdep"
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("CAMINHO-PARA-A-CHAVE") //~/.aws/credentials
    host        = self.public_dns
  }

  provisioner "file" {
    source      = "CAMINHO-PARA-A-CHAVE"
    destination = "DESTINO-PARA-A-CHAVE"
  }

  provisioner "file" {
    source      = "CAMINHO-PARA-O-ARQUIVO-SQL"
    destination = "DESTINO-PARA-O-ARQUIVO-SQL"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "chmod 700 NOME-DA-CHAVE",
      "sudo apt install mysql-client-core-8.0",
      "mysql -uadmin DNS-RDS -P3306 -p${var.db_password} < script.sql" #script populando o banco de dados
    ]
  }
}