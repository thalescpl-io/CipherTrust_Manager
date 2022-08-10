output "vm_public_ip_address" {
  description = "value of the public ip address of the CipherTrust Manager instance"
  value       = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
