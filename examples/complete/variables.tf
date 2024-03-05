variable "users" {
  type = list(object({
    access_roles         = map(bool)
    disabled             = optional(bool, false)
    email                = string
    name                 = string
    role                 = string
    send_user_invitation = optional(bool, true)
    username             = string
  }))
}
