terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.49.2"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}