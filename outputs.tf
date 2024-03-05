output "datadog_users" {
  value       = resource.datadog_user.users
  description = "A map of all Datadog user resources keyed by username."
}
