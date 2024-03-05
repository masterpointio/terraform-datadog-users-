variable "users" {
  type = list(object({
    disabled             = optional(bool, false)
    email                = string
    name                 = string
    roles                = set(string)
    send_user_invitation = optional(bool, true)
    username             = string
  }))

  validation {
    condition     = alltrue([for role in flatten([for user in var.users : user.roles]) : contains(["standard", "admin", "read_only"], role)])
    error_message = "Each role must be one of 'standard', 'admin', or 'read_only'."
  }
}
