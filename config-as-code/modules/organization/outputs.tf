output "organization_id" {
  description = "The ID of the GitHub organization"
  value       = github_organization_settings.org_settings.id
}

output "organization_name" {
  description = "The name of the GitHub organization"
  value       = github_organization_settings.org_settings.name
}

output "default_repository_permission" {
  description = "Default permission level for organization repositories"
  value       = github_organization_settings.org_settings.default_repository_permission
}

output "ruleset_id" {
  description = "The ID of the organization's ruleset"
  value       = github_organization_ruleset.default_ruleset.id
}

output "organization_project_ids" {
  description = "IDs of the GitHub organization projects"
  value       = [for i in range(length(var.organization_projects)) : github_organization_project.project[i].id]
}
