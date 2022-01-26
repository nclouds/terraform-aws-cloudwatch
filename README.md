<p align="left"><img width=400 height="100" src="https://www.nclouds.com/img/nclouds-logo.svg"></p>  

![Terraform](https://github.com/nclouds/terraform-aws-cloudwatch/workflows/Terraform/badge.svg)
# nCode Library

## AWS Cloudwatch (Log Group) Terraform Module

Terraform module to provision [`Cloudwatch Log Group`](https://aws.amazon.com/cloudwatch/) on AWS.

## Usage

### Setup

Create a Cloudwatch Log Group.
```hcl
    module "log_group" {
        source              = "app.terraform.io/ncodelibrary/cloudwatch/aws"
        version             = "0.1.4"
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
- [`examples/simple`](examples/simple)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| append\_workspace | Appends the terraform workspace at the end of resource names, <identifier>-<worspace> | `bool` | `true` | no |
| identifier | The name of the log group | `string` | `"test"` | no |
| kms\_key\_id | The ARN of the KMS Key to use when encrypting log data | `string` | `null` | no |
| retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653. | `number` | `30` | no |
| tags | Tags to be applied to the resource | `map(any)` | `{}` | no |
| use\_name\_prefix | Allow terraform to append a unique string at the end of resource names | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| output | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing
If you want to contribute to this repository check all the guidelines specified [here](.github/CONTRIBUTING.md) before submitting a new PR.
