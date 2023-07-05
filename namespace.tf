resource "kubernetes_namespace" "example" {
  metadata {
    annotations = {
      name = "dev"
    }
    name = "dev"
  }
}