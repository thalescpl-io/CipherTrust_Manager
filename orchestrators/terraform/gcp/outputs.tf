output "vm_public_ip_address" {
  description = "value of the public ip address of the CipherTrust Manager instance"
  value       = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

output "vm_ssh_public_key" {
    description = "value of the public ssh key of the CipherTrust Manager instance"
    value       = tls_private_key.ctm_ssh_key.public_key_openssh
}

output "vm_ssh_private_key" {
    description = "value of the public ssh key of the CipherTrust Manager instance"
    value       = tls_private_key.ctm_ssh_key.private_key_openssh
    sensitive = true
}