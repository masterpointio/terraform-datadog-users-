users = [
  {
    access_roles = {
      "datadog" = true,
      "aws"     = false,
    },
    email    = "john.doe@example.com",
    name     = "John Doe",
    role     = "Administrator",
    username = "johndoe"
  },
  {
    access_roles = {
      "datadog" = true,
      "aws"     = true,
    },
    email    = "jane.smith@example.com",
    name     = "Jane Smith",
    role     = "Editor",
    username = "janesmith"
  }
]

secret_mapping = [
  {
    name = "datadog_api_key"
    file = "example.yaml"
    type = "sops"
  },
  {
    name = "datadog_app_key"
    file = "example.yaml"
    type = "sops"
  }
]
