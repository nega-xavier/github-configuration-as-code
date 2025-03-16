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
  owner = var.organization_name
}

module "github_organization" {
  source = "./modules/organization"

  name = var.organization_name
  billing_email = var.billing_email

  # ruleset_enforcement = "active"
}