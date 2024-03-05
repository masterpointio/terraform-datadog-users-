locals {
  users = { for u in var.users : u.username => u }
  roles = {
    "standard"  = data.datadog_role.standard.id
    "admin"     = data.datadog_role.admin.id
    "read_only" = data.datadog_role.read_only.id
  }
}

resource "datadog_user" "users" {
  for_each             = local.users
  disabled             = each.value.disabled
  email                = each.value.email
  name                 = each.value.name
  roles                = [local.roles[each.value.access_roles["datadog"].role]]
  send_user_invitation = each.value.send_user_invitation
}
