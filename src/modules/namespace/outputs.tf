# Display load balancer hostname (typically present in AWS)
output "load_balancer_hostname" {
  value = kubernetes_ingress.simple_nginx.status.0.load_balancer.0.ingress.0.hostname
}
