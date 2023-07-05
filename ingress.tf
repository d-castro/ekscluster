#resource "kubernetes_ingress_v1" "test" {
#  metadata {
#    name      = "test"
#    namespace = "dev"
#  }
#  spec {
#    ingress_class_name = "nginx"
#    rule {
#        host = "teste.socialbank.com.br"
#      http {
#        path {
#          backend {
#            service {
#              name = kubernetes_service_v1.test.metadata.0.name
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}