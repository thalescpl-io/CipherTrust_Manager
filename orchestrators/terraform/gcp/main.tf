terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.31.0"
    }
  }
}


provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_compute_network" "ctm_network" {
  name                    = "ctm-vnet"
  auto_create_subnetworks = false
  description             = "Virtual network for CipherTrust Manager"
  project                 = var.gcp_project_id
}

# Public Subnet for CipherTrust Manager Instance
resource "google_compute_subnetwork" "ctm_subnetwork" {
  name          = "ctm-subnet"
  ip_cidr_range = "10.10.1.0/24"
  network       = google_compute_network.ctm_network.name
  region        = var.gcp_region
}

# Allow port 443 (https) access to CipherTrust Manager Instance
resource "google_compute_firewall" "ctm-https-firewall" {
  name    = "https-firewall"
  network = google_compute_network.ctm_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["web"]
}

# Allow port 22 (ssh) access to CipherTrust Manager Instance
resource "google_compute_firewall" "ctm-ssh-firewall" {
  name    = "ssh-firewall"
  network = google_compute_network.ctm_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["ssh"]
}

# Create (and display) an SSH key. Required to setup CipherTrust Manager Instance.
resource "tls_private_key" "ctm_ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}


# Create a public static IP address for CipherTrust Manager Instance
resource "google_compute_address" "public_static_ip" {
  name    = "ipv4-address"
}

# Create a CipherTrust Manager Instance
resource "google_compute_instance" "default" {
  name         = "ctm-instance"
  machine_type = "e2-standard-4" # Recommended machine type. For more information - https://thalesdocs.com/ctp/cm/latest/get_started/deployment/virtual-deployment/google-cloud-deployment/index.html#to-launch-a-ciphertrust-manager-instance

  zone = var.gcp_zone

  network_interface {
    network = google_compute_network.ctm_network.name
    subnetwork = google_compute_subnetwork.ctm_subnetwork.name
    access_config {
      nat_ip = google_compute_address.public_static_ip.address
    }
  }

  # Attach marketplace image to the virtual machine.
  boot_disk {
    initialize_params {
      image = "projects/thales-cpl-public/global/images/k170v-7157-20220421155738"
    }
  }
}
