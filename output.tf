output "endpoint" {
  value = aws_eks_cluster.api_ekscluster01padd01.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.api_ekscluster01padd01.certificate_authority[0].data
}