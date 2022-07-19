data "tls_certificate" "eks" {
  url = aws_eks_cluster.api_ekscluster01padd01.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.api_ekscluster01padd01.identity[0].oidc[0].issuer
}
resource "aws_iam_role" "ftp" {
  name = "ftp"
  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "AllowFullAccesstoS3",
                "Effect": "Allow",
                "Action": [
                    "s3:*"
                ],
                "Resource": "*"
            }
        ]
    }
  POLICY
}

resource "aws_iam_role_policy" "ftp" {
  name = "tf-test-transfer-user-iam-policy"
  role = aws_iam_role.ftp.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowFullAccesstoS3",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_transfer_user" "ftp" {
  server_id = aws_transfer_server.awstserverpa4dd01.id
  user_name = "tftestuser"
  role      = aws_iam_role.ftp.arn

  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry  = "/"
    target = "/bucket3/"
  }
}