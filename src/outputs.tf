# Display load balancer hostname (typically present in AWS)
output "load_balancer_hostname" {
  value = module.namespace.load_balancer_hostname
}
