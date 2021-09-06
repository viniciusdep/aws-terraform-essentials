#===============CRIAÇÃO DA VPC===============#
# É uma boa pratica isolar a VPC do EKS para simular um datacenter real. 

resource "aws_vpc" "eks-vpc-vdep" {
  # The CIDR block for the VPC.
  cidr_block = "10.0.0.0/21"

  # Makes your instances shared on the host.
  instance_tenancy = "default"

  # Required for EKS. Enable/disable DNS support in the VPC.
  enable_dns_support = true

  # Required for EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Enable/disable ClassicLink for the VPC.
  enable_classiclink = false

  # Enable/disable ClassicLink DNS Support for the VPC.
  enable_classiclink_dns_support = false

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "eks-vpc-vdep"
  }
}