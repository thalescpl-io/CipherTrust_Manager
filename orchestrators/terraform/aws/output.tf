output "public_ip_address" {
  description = "CipherTrust Manager's Public IP Address"
  value = aws_instance.cm_instance.public_ip
}

output "tls_private_key" {
  description = "CipherTrust Manager's Admin SSH Private Key"
  value     = tls_private_key.ctm_ssh_key.private_key_pem
  sensitive = true
}

output "tls_public_key" {
  description = "CipherTrust Manager's Admin SSH Public Key"
  value = tls_private_key.ctm_ssh_key.public_key_openssh
}