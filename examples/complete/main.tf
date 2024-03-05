module "datadog_user" {
  source = "../.."

  users          = var.users
  secret_mapping = var.secret_mapping
}
