terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~>4.0"
    }
  }
}

provider "okta" {
  org_name  = "integrator-6376783"
  base_url  = "okta.com"
  api_token = var.API_TOKEN
}