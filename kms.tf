resource "aws_kms_key" "kms_to_nodes_eks" {
  description = "KMS to encrypte EKS nodes"
}