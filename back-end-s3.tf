terraform {
  backend "s3" {
    bucket  = "socialbank-terraform-state"
    key     = "eks/eks-autorizador-dev/terraform.tfstate"
    region  = "sa-east-1"
    profile = "socialbank"
  }
}