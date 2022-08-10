variable "gcp_project_id" {
    type = string
    description = "Google Cloud Platform project ID"
}

variable "gcp_region" {
    type = string
    description = "resource region on GCP"
    default = "us-east1"
}

variable "gcp_zone" {
    type = string
    description = "resource zone in region on GCP"
    default = "us-east1-c"
}