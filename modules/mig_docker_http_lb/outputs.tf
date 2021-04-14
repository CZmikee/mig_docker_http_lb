
output "external_ip" {
  description = "The external IP assigned to the global forwarding rule."
  value       = google_compute_global_forwarding_rule.http-rule.ip_address
}
