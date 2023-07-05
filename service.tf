#resource "kubernetes_service_v1" "test" {
#  metadata {
#    name      = "test"
#    namespace = kubernetes_namespace.example.id
#  }
#  spec {
#    selector = {
#      app = kubernetes_pod.example2.metadata.0.labels.app
#    }
#    session_affinity = "ClientIP"
#    port {
#      port        = 8080
#      target_port = 80
#    }
#
#    type = "ClusterIP"
#  }
#  depends_on = [kubernetes_pod.example2]
#}
#
#resource "kubernetes_pod" "example2" {
#  metadata {
#    name      = "nginx"
#    namespace = kubernetes_namespace.example.id
#    labels = {
#      app = "nginx"
#    }
#  }
#
#  spec {
#    container {
#      image = "nginx:1.7.9"
#      name  = "example"
#
#      port {
#        container_port = 8080
#      }
#    }
#  }
#}