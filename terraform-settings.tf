# Terraform required providers block
terraform {
  # Required Terraform Version
  # Download later/latest versions from: https://releases.hashicorp.com/terraform/
  required_version = "~> 1.0.9"
  # Required Terraform Provider and version 
  required_providers {
    aws = {
      # To fix error, find available versions here --> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-3-upgrade#provider-version-configuration
      version = "~> 3.0.0"
      source  = "hashicorp/aws"
    }
    # Google Provider and version
    # Link: https://registry.terraform.io/providers/hashicorp/google/latest
    google = {
      # To fix error, find available versions here --> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-3-upgrade#provider-version-configuration
      version = "~> 3.87.0" # Explain where this is the latest version from the above Google Provider Main Page
      source  = "hashicorp/google"
    }
  }
}