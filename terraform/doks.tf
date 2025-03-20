
# Cluster estático, sem auto scaling
resource "digitalocean_kubernetes_cluster" "doks_cluster" {
  name     = "fake-shop-cluster"
  region   = "nyc2"
  version  = "1.32.2-do.0"
  vpc_uuid = digitalocean_vpc.doks_vpc.id

  node_pool {
    name       = "fake-shop-workers"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}