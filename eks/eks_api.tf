resource "aws_eks_cluster" "api_ekscluster01padd01" {
  name     = "api_ekscluster01padd01"
  role_arn = aws_iam_role.api_eksrole01padd01.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-main.id,
      aws_subnet.public-main.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}
