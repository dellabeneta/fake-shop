
output "vpc_ip_range" {
  description = "Faixa de IP da VPC"
  value       = digitalocean_vpc.doks_vpc.ip_range
}

output "kubeconfig" {
  description = "Kubeconfig do cluster"
  value       = digitalocean_kubernetes_cluster.doks_cluster.kube_config[0].raw_config
  sensitive   = true
}