#===============CRIAÇÃO DE ROLES===============#
# Permitindo o uso de alguns recursos na AWS

resource "aws_iam_role" "iam-cluster" {
  name = "iam-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com" 
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "iam-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" # Permitindo o uso de recursos do AWS_EKS_CLUSTER
  role       = aws_iam_role.iam-cluster.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "iam-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController" # Permite o controle dos recrusos dentro da VPC (Pods e nós..)
  role       = aws_iam_role.iam-cluster.name
}