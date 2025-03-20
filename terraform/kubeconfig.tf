
resource "local_file" "kubeconfig" {
  depends_on = [digitalocean_kubernetes_cluster.doks_cluster]

  filename        = pathexpand("~/.kube/config")
  content         = digitalocean_kubernetes_cluster.doks_cluster.kube_config[0].raw_config
  file_permission = "600"
}