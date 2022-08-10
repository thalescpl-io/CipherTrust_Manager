# Deploy CipherTrust Manager on Google Cloud Plataform using Terraform

[Terraform](https://terraform.io/) is an orchestrator created by HashiCorp. They have an Open Source version that you can download and manage yourself. They also have it "as a Service" where the orchestrator is managed by HashiCorp, themselves. For this script, we are using the Open Source version. There may be differences with the "as a Service" version. If you run into differences, feel free to update this repo.

## Pre-requisite Installations
* [Git](https://gitscm.org)
* [Terraform](https://terraform.io/downloads)
* [GCloud CLI](https://cloud.google.com/sdk/docs/install-sdk#installing_the_latest_version)

## 1. Clone this Repository
```bash
git clone https://github.com/thalescpl-io/CipherTrust_Manager.git
cd CipherTrust_Manager/orchestrators/terraform/gcp/
```

## 2. Login to GCloud CLI
```bash
gcloud init
```

## 3. Initialize Terraform Modules
```bash
terraform init
```

## 4. Plan and Apply Terraform Configurations
```bash
terraform apply
```

## Optional Configuration
**Resource Region** (`gcp_region`) - Set resource region on GCP. Default - `us-east1`\
Example:
```bash
terraform apply -var gcp_region="us-east1"
```

**Resource Zone** (`gcp_zone`) - Set resource zone in region on GCP. Default - `us-east-1a`\
Example:
```bash
terraform apply -var gcp_region="us-east1" -var gcp_zone="us-east1-a"
```
