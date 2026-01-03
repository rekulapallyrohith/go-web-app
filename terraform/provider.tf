terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_eks_cluster" "base" {
  name = aws_eks_cluster.base.name
}

data "aws_eks_cluster_auth" "base" {
  name = aws_eks_cluster.base.name
}

provider "kubernetes" {
  host = data.aws_eks_cluster.base.endpoint
  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.base.certificate_authority[0].data
  )
  token = data.aws_eks_cluster_auth.base.token
}
