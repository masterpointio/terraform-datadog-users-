# terraform-datadog-users

[![Release](https://img.shields.io/github/release/masterpointio/terraform-datadog-users.svg)](https://github.com/masterpointio/terraform-datadog-users/releases/latest)

This Terraform module is designed to create and manage Datadog user accounts.

The users are associated with one of the three [out-of-the-box roles](https://docs.datadoghq.com/account_management/rbac/permissions/):

- Datadog Admin
- Datadog Standard
- Datadog Read Only

## Usage

```hcl
module "datadog_users" {
  source  = "masterpointio/datadog/users"
  version = "X.X.X"

  users = [
    {
      roles    = ["standard"],
      email    = "jane.smith@example.com",
      name     = "Jane Smith",
      role     = "Editor",
      username = "janesmith"
    }
  ]
}
```

Check out [examples/complete](examples/complete) for the full example.

To ensure the secure handling of DataDog sensitive data for datadog/datadog provider, the module's example is designed to work with the [SOPS (Secrets OPerationS)](https://github.com/mozilla/sops) provider. SOPS is a tool for encrypting and decrypting files containing sensitive data, often used in conjunction with Terraform to manage secrets. The example also utilizes [terraform-secrets-helper](https://github.com/masterpointio/terraform-secrets-helper/tree/main) module - a helper that provides a standard way of managing secrets from different sources, incuding SOPS files.

❗ We recommend to use AWS KMS, GCP KMS, Azure Key Vault for SOPS files encryption. Don't use the secrets from the example in your real configuration!

Here are some basic SOPS operations that help you to work with the example:

- Pass `age` key to SOPS provider configuration:

```sh
cd ./example/complete
export SOPS_AGE_KEY_FILE=key.txt
```

- Encryption/decryption via SOPS editior

```sh
sops example.yaml
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3  |
| <a name="requirement_datadog"></a> [datadog](#requirement_datadog)       | >= 3.14 |

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_datadog"></a> [datadog](#provider_datadog) | >= 3.14 |

## Modules

No modules.

## Resources

| Name                                                                                                            | Type        |
| --------------------------------------------------------------------------------------------------------------- | ----------- |
| [datadog_user.users](https://registry.terraform.io/providers/datadog/datadog/latest/docs/resources/user)        | resource    |
| [datadog_role.admin](https://registry.terraform.io/providers/datadog/datadog/latest/docs/data-sources/role)     | data source |
| [datadog_role.read_only](https://registry.terraform.io/providers/datadog/datadog/latest/docs/data-sources/role) | data source |
| [datadog_role.standard](https://registry.terraform.io/providers/datadog/datadog/latest/docs/data-sources/role)  | data source |

## Inputs

| Name                                             | Description | Type                                                                                                                                                                                                     | Default | Required |
| ------------------------------------------------ | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_users"></a> [users](#input_users) | n/a         | <pre>list(object({<br> disabled = optional(bool, false)<br> email = string<br> name = string<br> roles = set(string)<br> send_user_invitation = optional(bool, true)<br> username = string<br> }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                       | Description                                            |
| -------------------------------------------------------------------------- | ------------------------------------------------------ |
| <a name="output_datadog_users"></a> [datadog_users](#output_datadog_users) | A map of all Datadog user resources keyed by username. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

Contributions are welcome and appreciated!

Found an issue or want to request a feature? [Open an issue](TODO)

Want to fix a bug you found or add some functionality? Fork, clone, commit, push, and PR and we'll check it out.

If you have any issues or are waiting a long time for a PR to get merged then feel free to ping us at [hello@masterpoint.io](mailto:hello@masterpoint.io).

## Built By

[![Masterpoint Logo](https://i.imgur.com/RDLnuQO.png)](https://masterpoint.io)
