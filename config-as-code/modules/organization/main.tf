terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.0"
    }
  }
}

resource "github_organization_settings" "org_settings" {
  billing_email                         = var.billing_email
  name                                  = var.name
  description                           = try(var.description, null)
  has_organization_projects             = var.has_organization_projects
  has_repository_projects               = var.has_repository_projects
  default_repository_permission         = var.default_repository_permission
  members_can_create_repositories       = var.members_can_create_repositories
  members_can_create_pages              = var.members_can_create_pages
  members_can_fork_private_repositories = var.members_can_fork_private_repositories
}

resource "github_organization_ruleset" "default_ruleset" {
  name        = var.ruleset_name
  target      = "branch"
  enforcement = var.ruleset_enforcement

  conditions {
    repository_name {
      exclude = []
      include = ["*"]
    }

    ref_name {
      include = var.ruleset_branches
      exclude = []
    }
  }

  rules {
    pull_request {
      dismiss_stale_reviews_on_push   = true
      require_code_owner_review       = true
      required_approving_review_count = var.required_review_count
    }
  }
}

resource "github_organization_project" "project" {
  count = length(var.organization_projects)

  name = var.organization_projects[count.index].name
  body = try(var.organization_projects[count.index].body, "")
}