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

variable "ct_name" {
  type = string
}

variable "ct_cpu_cores" {
  type = string
}

variable "ct_memory" {
  type = number
}

variable "ct_ipconfig" {
  type = string
}

variable "ct_gw" {
  type = string
}

variable "ct_disk" {
  type = string
}

variable "ssh_pri_key_path" {
  type = string
}

variable "ssh_pub_key" {
  type = string
}

variable "nameserver" {
  type = string
}

variable "external_endpoint" {
  type = string
}