variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_node" {
  type = string
}

variable "proxmox_storage" {
  type = string
}

variable "cpu_type" {
  type    = string
  default = "kvm64"
}

variable "cores" {
  type    = string
  default = "2"
}

variable "cloudinit_storage_pool" {
  type    = string
  default = "local-lvm"
}

variable "talos_version" {
  type    = string
  default = "v1.6.7"
}

locals {
  image = "https://github.com/talos-systems/talos/releases/download/${var.talos_version}/nocloud-amd64.raw.xz"
}