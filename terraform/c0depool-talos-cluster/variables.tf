variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "proxmox_node" {
  type = string
}

variable "clone_target" {
  type    = string
  default = "talos-v1.7.1-cloud-init-template"
}