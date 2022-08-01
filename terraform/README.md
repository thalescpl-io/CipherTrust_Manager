# Deploy CiphterTrust Manager using Terraform

## Deploy on
- [Azure](#installation-on-azure)
- Google Cloud Platform (GCP) - `Coming Soon`
- Amazon Web Services (AWS) - `Coming Soon`

---

## Installation on Azure

### Pre-requisite Installations
* [Git](https://gitscm.org)
* [Terraform](https://terraform.io/downloads)
* [Azure](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### 1. Clone this Repository
```bash
git clone https://github.com/thalescpl-io/CipherTrust_Manager.git
cd Ciphtertrust_Manager/terraform/azure
```

### 2. Login to Azure CLI
```bash
az login
```

### 3. Initialize Terraform Modules
```bash
terraform init
```

### 4. Plan and Apply Terraform Configurations
```bash
terraform apply
```

### Optional Configuration
**Resource Group Location** (`resource_group_location`) - Set resource group location on Azure. Default - `eastus`\
Example:
```bash
terraform apply -var resource_group_location="northcentralus"
```

**Resource Group Name Prefix** (`resource_group_name_prefix`) - Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription. Default - `rg`\
Example:
```bash
terraform apply -var resource_group_location="ctm"
```

---
## Installation on Google Cloud Platform
`Coming Soon`

---
## Installation on AWS
`Coming Soon`

