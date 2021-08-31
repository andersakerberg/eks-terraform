resource "kubernetes_namespace" "main" {
  metadata {
    annotations = {
      name = "example-annotation"
    }
    labels = {
      mylabel = "label-value"
    }
    name = "main"
  }
}
