# Deploy CipherTrust Manager on Azure using Terraform

[Terraform](https://terraform.io/) is an orchestrator created by HashiCorp. They have an Open Source version that you can download and manage yourself. They also have it "as a Service" where the orchestrator is managed by HashiCorp, themselves. For this script, we are using the Open Source version. There may be differences with the "as a Service" version. If you run into differences, feel free to update this repo.

## Pre-requisite Installations
* [Git](https://gitscm.org)
* [Terraform CLI](https://terraform.io/downloads)
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## 1. Clone this Repository
```bash
git clone https://github.com/thalescpl-io/CipherTrust_Manager.git
cd CipherTrust_Manager/orchestrators/terraform/azure/
```

## 2. Login to Azure CLI
```bash
az login
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
