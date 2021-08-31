
locals {
  namespace_name = "main"
}
resource "kubernetes_namespace" "main" {
  metadata {
    annotations = {
      name = "example-annotation"
    }
    labels = {
      mylabel = "label-value"
    }
    name = local.namespace_name
  }
}


resource "kubernetes_deployment" "simple_nginx" {
  metadata {
    name = "terraform-example"
    labels = {
      app = "simple_nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "simple_nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "simple_nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simple_nginx" {
  metadata {
    name = "simple-nginx"
  }
  spec {
    selector = {
      app = kubernetes_deployment.simple_nginx.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_ingress" "simple_nginx" {
  wait_for_load_balancer = true
  metadata {
    name = "example"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service_name = kubernetes_service.simple_nginx.metadata.0.name
            service_port = 80
          }
        }
      }
    }
  }
}
