terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
# provider "aws" {
#   region     = var.aws_region
#   access_key = var.aws_access_id
#   secret_key = var.aws_access_secret
# }

# Create (and display) an SSH key. Required to setup CipherTrust Manager Instance.
resource "tls_private_key" "ctm_ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}



# Creating an instance of CipherTrust Manager Community Edition from the AWS Marketplace - https://aws.amazon.com/marketplace/pp/prodview-adjvglziiunpg
resource "aws_instance" "cm_instance" {
    ami = "ami-0f45114643eae346b"
    instance_type = "t2.xlarge"   # Recommended Size
    vpc_security_group_ids = [aws_security_group.cm_firewall.id]
    subnet_id = aws_subnet.public_subnet.id
    tags = {
            Name = "Ciphertrust Manager Instance"
        }
    
    root_block_device {
      volume_size = 100   # Recommended size to run CipherTrust Manager in production
      volume_type = "gp2"   # For higher volume transactions, you might want to update the type of EBS volume.
    }
      

}
