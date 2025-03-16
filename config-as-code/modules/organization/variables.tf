variable "billing_email" {
  type        = string
  description = "Billing email for the GitHub organization"
}

variable "description" {
  type        = string
  description = "Description for the GitHub organization"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name for the GitHub organization and Terraform state"
}

variable "has_organization_projects" {
  type        = bool
  description = "Enable organization projects"
  default     = true
}

variable "has_repository_projects" {
  type        = bool
  description = "Allow repositories to have their own projects"
  default     = true
}

variable "default_repository_permission" {
  type        = string
  description = "Default repository permission for the organization members"
  default     = "read"
}

variable "members_can_create_repositories" {
  type        = bool
  description = "Allow members to create repositories"
  default     = false
}

variable "members_can_create_pages" {
  type        = bool
  description = "Allow members to create pages"
  default     = false
}

variable "members_can_fork_private_repositories" {
  type        = bool
  description = "Members can fork private repositories"
  default     = false
}

variable "ruleset_branches" {
  type        = list(string)
  description = "List of branches ruleset will be applied to"
  default     = ["main", "master"]
}

variable "ruleset_name" {
  type        = string
  description = "Name of the organization ruleset"
  default     = "Main Branch Protection"
}

variable "ruleset_enforcement" {
  type        = string
  description = "Enforcement level of ruleset (active, evaluate)"
  default     = "active"
}

variable "required_review_count" {
  type        = number
  description = "Number of required reviews for pull requests"
  default     = 2
}

variable "organization_projects" {
  type = list(object({
    name        = string
    description = string
  }))
  default = []
}