terraform {
  backend "remote" {
    organization = "c0depool"
    workspaces {
      name = "c0depool-hetzner-vm"
    }
  }
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.51.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}