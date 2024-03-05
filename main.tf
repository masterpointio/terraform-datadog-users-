locals {
  dd_team = {
    for member in var.users :
    member.username => member if member.access_roles["datadog"]
  }
}

data "datadog_role" "standard" {
  filter = "Datadog Standard Role"
}

resource "datadog_user" "users" {
  for_each             = local.dd_team
  disabled             = each.value.disabled
  email                = each.value.email
  name                 = each.value.name
  roles                = [data.datadog_role.standard.id]
  send_user_invitation = each.value.send_user_invitation

  lifecycle {
    ignore_changes = [name]
  }
}
