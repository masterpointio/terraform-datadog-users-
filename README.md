# terraform-datadog-users

[![Release](https://img.shields.io/github/release/masterpointio/terraform-datadog-users.svg)](https://github.com/masterpointio/terraform-datadog-users/releases/latest)

This Terraform module is designed to create and manage Datadog user accounts, with a specific focus on security and sensitive data handling.

To ensure the secure handling of DataDog sensitive data for datadog/datadog provider, the module is designed to work with the [SOPS (Secrets OPerationS) provider](https://github.com/mozilla/sops). SOPS is a tool for encrypting and decrypting files containing sensitive data, often used in conjunction with Terraform to manage secrets.

The module utilizes [terraform-secrets-helper](https://github.com/masterpointio/terraform-secrets-helper/tree/main) module - a helper that provides a standard way of managing secrets from different sources, incuding SOPS files.

## Usage

```hcl
module "datadog_users" {
  source  = "masterpointio/datadog/users"
  version = "X.X.X"

  users = [
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
}
```

Check out [examples/complete](examples/complete) for the full example.

❗ We recommend to use AWS KMS, GCP KMS, Azure Key Vault for SOPS files encryption. Don't use the secrets from the example in your real configuration!

Here are some basic SOPS operations that help you to work with the example:

- SOPS provider configuration for the example:

```sh
cd ./example/complete
export SOPS_AGE_KEY_FILE=key.txt
```

- Encryption

```sh
sops --encrypt --age age1uafwjn52f8qvdeyqgn5epens4nwpqaqld8ln47xs8an003r3gudqxpzt7m example.raw.yaml > example.yaml
```

- Decryption

```sh
sops --age age1uafwjn52f8qvdeyqgn5epens4nwpqaqld8ln47xs8an003r3gudqxpzt7m example.yaml
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3  |
| <a name="requirement_datadog"></a> [datadog](#requirement_datadog)       | >= 3.14 |
| <a name="requirement_sops"></a> [sops](#requirement_sops)                | >= 0.5  |

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_datadog"></a> [datadog](#provider_datadog) | >= 3.14 |

## Modules

| Name                                                     | Source                       | Version |
| -------------------------------------------------------- | ---------------------------- | ------- |
| <a name="module_secrets"></a> [secrets](#module_secrets) | masterpointio/helper/secrets | 0.2.0   |

## Resources

| Name                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------- | ----------- |
| [datadog_user.users](https://registry.terraform.io/providers/datadog/datadog/latest/docs/resources/user)       | resource    |
| [datadog_role.standard](https://registry.terraform.io/providers/datadog/datadog/latest/docs/data-sources/role) | data source |

## Inputs

| Name                                                                        | Description                                                                                                                                 | Type                                                                                                                                                                                                                            | Default | Required |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_secret_mapping"></a> [secret_mapping](#input_secret_mapping) | The list of secret mappings the application will need.<br>This creates secret values for the component to consume at `local.secrets[name]`. | <pre>list(object({<br> name = string<br> type = string<br> path = optional(string, null)<br> file = string<br> }))</pre>                                                                                                        | `[]`    |    no    |
| <a name="input_users"></a> [users](#input_users)                            | n/a                                                                                                                                         | <pre>list(object({<br> access_roles = map(bool)<br> disabled = optional(bool, false)<br> email = string<br> name = string<br> role = string<br> send_user_invitation = optional(bool, true)<br> username = string<br> }))</pre> | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)
