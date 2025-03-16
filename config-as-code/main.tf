terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "github" {
  owner = "abyssinia-io"
}

module "github_organization" {
  source = "./modules/organization"

  name = var.organization_name
  billing_email = var.billing_email

  # ruleset_enforcement = "active"
}