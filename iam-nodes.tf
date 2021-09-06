#===============CRIAÇÃO DE ROLES===============#
# Criando Roles para permitir o uso do serviços do nosso provider 

resource "aws_iam_role" "iam-nodes" {
  name = "iam-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com" # Permitindo o uso dos recursos de EC2 na AWS
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "iam-nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" # Permitindo o uso de EKS WorkerNodes
  role       = aws_iam_role.iam-nodes.name
}

resource "aws_iam_role_policy_attachment" "iam-nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy" # Permitindo o uso dos recursos EKS 
  role       = aws_iam_role.iam-nodes.name
}

resource "aws_iam_role_policy_attachment" "iam-nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" # Permite a leitura dos serviços de ECR na AWS
  role       = aws_iam_role.iam-nodes.name
}