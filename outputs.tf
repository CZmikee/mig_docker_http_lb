
output "external_ip" {
  description = "The external IP assigned to the global forwarding rule."
  value = {
    for k, group in module.mig_docker_http_lb : k => group.external_ip
  }
}