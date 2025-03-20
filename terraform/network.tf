resource "digitalocean_vpc" "doks_vpc" {
  name     = "doks-vpc"
  region   = "nyc2"
  ip_range = "10.0.0.0/24"
}
