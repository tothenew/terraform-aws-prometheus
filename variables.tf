variable "instance_type_prometheus" {
    description = "This defines Prometheus Instance Size/Type"
    type        = string
    default     = ""
}
variable "volume_size_prometheus" {
    description = "This defines Prometheus Instance Root Volume Size"
    type        = number
    default     = "30"
}
variable "pem_key_name" {
    description = "This defines Pem Key Name"
    type        = string
    default     = ""
}
variable "environment" {
    description = "This defines the Environment Tag"
    type        = string
    default     = ""
}
variable "vpc_id" {
    description = "This defines Prometheus Instance VPC ID"
    type        = string
    default     = ""
}
variable "vpc_cidr_block" {
    description = "This defines Prometheus Instance VPC CIDR Block"
    type        = string
    default     = ""
}
variable "subnet_id" {
    description = "This defines Prometheus Instance VPC Subnet ID"
    type        = string
    default     = ""
}
variable "kube_cluster_endpoint" {
    description = "This defines Kubernetes Cluster Endpoint whom Prometheus will Connect"
    type        = string
    default     = ""
}
variable "kube_cluster_token" {
    description = "This defines Kubernetes Cluster Service Account Token"
    type        = string
    default     = ""
}
