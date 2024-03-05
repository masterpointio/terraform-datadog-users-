terraform {
  required_version = "~> 1.5"

  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.14"
    }
  }
}
