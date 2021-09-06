variable "cluster_name" {
  default = "NOME-DO-CLUSTER"
}

variable "bastion_image" {
  default     = "COD-ami"
  type        = string
  description = "Imagem para o bastion"
}

variable "my_key" {
  default     = "NOME-DA-PRIVATE-KEY"
  type        = string
  description = "Minha chave .pem"
}

variable "db_user" {
  default     = "admin"
  type        = string
  description = "Nome do meu db"

}

variable "db_name" {
  default     = "cadastro"
  type        = string
  description = "Nome do meu db"

}

variable "db_password" {
  default     = "SENHA-DO-DB" #Não é uma boa pratica usar senhas como variaveis
  type        = string
  description = "senha do db"

}