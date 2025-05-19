module "prometheus" {
    source = "../"
    instance_type_prometheus = "t3.medium"
    volume_size_prometheus = "30"
    pem_key_name = "prometheus"
    environment = "qa"
    vpc_cidr_block = ""
    vpc_id = ""
    subnet_id = ""
    kube_cluster_endpoint = ""
    kube_cluster_token = ""
}
