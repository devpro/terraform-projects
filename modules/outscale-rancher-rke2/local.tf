resource "local_file" "kube_config_workload_yaml" {
  filename = format("%s/%s", path.root, "kube_config_workload.yaml")
  content  = rancher2_cluster_v2.quickstart_workload.kube_config
}
