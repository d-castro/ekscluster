locals {
  tags = {
    "k8s.io/cluster-autoscaler/enabled"             = "TRUE"
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
    "kubernetes.io/cluster/${var.cluster_name}"     = "owned"
  }
}