variable "API_TOKEN" {
  type      = string
  sensitive = true
}

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

resource "okta_group" "exhibit_a" {
  name        = "Freedom Fighters"
  description = "This is the first mock group"
}

resource "okta_user" "user_a" {
  first_name = "Teddy"
  last_name  = "Pendergrass"
  login      = "tpendergrass@glasscliff.online"
  email      = "tpendergrass@glasscliff.online"
}

resource "okta_group_memberships" "group_a_membership" {
  group_id = okta_group.exhibit_a.id
  users = [
    okta_user.user_a.id
  ]
}

resource "okta_app_bookmark" "internal_portal" {
  label = "Freedom Fighters"
  url   = "https://glasscliff.online"
}

resource "okta_app_group_assignment" "app_group_assignment" {
    app_id = okta_app_bookmark.internal_portal.id
    group_id = okta_group.exhibit_a.id
}