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

variable "vm_id" {
  type    = string
  default = "9700"
}

variable "talos_version" {
  type    = string
  default = "v1.6.7"
}

variable "base_iso_file" {
  type = string
}

locals {
  image = "https://factory.talos.dev/image/613e1592b2da41ae5e265e8789429f22e121aab91cb4deb6bc3c0b6262961245/${var.talos_version}/nocloud-amd64.raw.xz"
}