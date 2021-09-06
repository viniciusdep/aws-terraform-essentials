#===============CRIAÇÃO DE PROVIDERS===============#
# Definindo provider e versões

provider "aws" {
  region  = "us-east-1"
  profile = "PROFILE-NAME"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.40.0"
    }
  }
}