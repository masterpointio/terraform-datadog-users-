provider "datadog" {
  api_key = local.secrets.datadog_api_key
  app_key = local.secrets.datadog_app_key
}
