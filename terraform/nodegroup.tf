resource "aws_eks_node_group" "base" {
  cluster_name    = aws_eks_cluster.base.name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = aws_subnet.private[*].id

  scaling_config {
    desired_size = 2
    max_size     = 6
    min_size     = 2
  }

  instance_types = ["t3.small"]
  ami_type       = "AL2_x86_64"

  depends_on = [
    aws_iam_role_policy_attachment.node_policies
  ]
}
