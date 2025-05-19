# terraform-aws-prometheus

[![Lint Status](https://github.com/dhruvguptaTTN/terraform-aws-prometheus/workflows/Lint/badge.svg)](https://github.com/dhruvguptaTTN/terraform-aws-prometheus/actions)
[![LICENSE](https://img.shields.io/github/license/dhruvguptaTTN/terraform-aws-prometheus)](https://github.com/dhruvguptaTTN/terraform-aws-prometheus/blob/main/LICENSE)

This module provisions a **Prometheus monitoring server** on AWS using an EC2 instance. The module handles SSH key generation, instance provisioning, security group configuration, SSM access, and bootstraps Prometheus using a user data script. It is designed to integrate Prometheus with an existing Kubernetes cluster via remote access.

## Introduction

This module is designed for DevOps engineers or platform teams looking to quickly set up a self-hosted Prometheus instance on AWS for monitoring purposes. It is especially useful when managed services are not an option, and a customizable EC2-based Prometheus setup is preferred.

## Resources Created and Managed

- `tls_private_key` – Generates a new SSH private/public key pair.
- `aws_key_pair` – AWS Key Pair resource using the generated public key.
- `aws_instance` – EC2 instance running Prometheus.
- `aws_security_group` – Security group allowing port 22 (SSH) and port 9090 (Prometheus).
- `aws_iam_role` and `aws_iam_instance_profile` – IAM role for SSM and CloudWatch agent access.
- `data.template_file` – Renders the Prometheus startup script (`prometheus.sh`) using input variables.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

- aws_instance.prometheus
- aws_key_pair.ssh_key
- aws_security_group.prometheus_sg
- aws_iam_role.ssm_access
- aws_iam_instance_profile.ssm_access_instance_profile
- aws_iam_role_policy_attachment.ssm_policy
- aws_iam_role_policy_attachment.cw_agent_policy
- tls_private_key.ssh_private_key
- data.template_file.userdata

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| instance_type_prometheus | This defines Prometheus Instance Size/Type | `string` | `""` |
| volume_size_prometheus | This defines Prometheus Instance Root Volume Size | `number` | `30` |
| pem_key_name | This defines Pem Key Name | `string` | `""` |
| environment | This defines the Environment Tag | `string` | `""` |
| vpc_id | This defines Prometheus Instance VPC ID | `string` | `""` |
| vpc_cidr_block | This defines Prometheus Instance VPC CIDR Block | `string` | `""` |
| subnet_id | This defines Prometheus Instance VPC Subnet ID | `string` | `""` |
| kube_cluster_endpoint | This defines Kubernetes Cluster Endpoint whom Prometheus will Connect | `string` | `""` |
| kube_cluster_token | This defines Kubernetes Cluster Service Account Token | `string` | `""` |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Example Usage

```hcl
module "prometheus" {
  source = "git::https://github.com/dhruvguptaTTN/terraform-aws-prometheus.git"
  kube_cluster_endpoint    = "https://<K8S_ENDPOINT>"
  kube_cluster_token       = "<K8S_TOKEN>"
}
