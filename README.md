# AWS Cloudwatch (Log Group) Terraform Module

Terraform module to provision [`Cloudwatch Log Group`](https://aws.amazon.com/cloudwatch/) on AWS.

## Usage

### Setup

Create a Cloudwatch Log Group.
```hcl
    module "log_group" {
        source              = "app.terraform.io/ncodelibrary/cloudwatch/aws"
        version             = "0.1.2"
        identifier          = "example"
        retention_in_days   = 7
        tags                = {
            Owner           = "sysops"
            env             = "dev"
            Cost_Center     = "XYZ"
        }
    }
```

## Examples
Here are some working examples of using this module:
- [`examples/`](examples/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| identifier | The name of the security group | `string` | n/a | yes |
| retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653. | `number` | `30` | no |
| tags | Tags to be applied to the resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| output | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing
If you want to contribute to this repository check all the guidelines specified [here](.github/CONTRIBUTING.md) before submitting a new PR.
