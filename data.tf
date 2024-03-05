data "datadog_role" "standard" {
  filter = "Datadog Standard Role"
}

data "datadog_role" "admin" {
  filter = "Datadog Admin Role"
}

data "datadog_role" "read_only" {
  filter = "Datadog Read Only Role"
}
