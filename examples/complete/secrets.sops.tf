module "secrets" {
  source         = "masterpointio/helper/secrets"
  version        = "0.2.0"
  secret_mapping = var.secret_mapping
}

variable "secret_mapping" {
  type = list(object({
    name = string
    type = string
    path = optional(string, null)
    file = string
  }))
  default     = []
  description = <<-EOT
    The list of secret mappings the application will need.
    This creates secret values for the component to consume at `local.secrets[name]`.
    EOT
}

# Reference your secrets using the module output
locals {
  # tflint-ignore: terraform_unused_declarations
  secrets = module.secrets.all
}
