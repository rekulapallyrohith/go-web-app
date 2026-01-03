output "cluster_name" {
  value = aws_eks_cluster.base.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.base.endpoint
}

output "cluster_ca" {
  value = aws_eks_cluster.base.certificate_authority[0].data
}
