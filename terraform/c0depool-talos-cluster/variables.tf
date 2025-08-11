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

variable "vm_master_nodes" {
  description = "Configuration details for Talos master nodes"
  type = map(object({
    vm_id          = number
    node_name      = string
    node_cpu_cores = string
    node_memory    = number
    node_disk      = string
  }))
}

variable "vm_master_start_ip" {
  description = "Starting IP for Talos master nodes"
  type        = string
}

variable "vm_worker_nodes" {
  description = "Configuration details for Talos worker nodes."
  type = map(object({
    vm_id          = number
    node_name      = string
    node_cpu_cores = string
    node_memory    = number
    node_disk      = string
    # For longhorn
    additional_node_disk = string
  }))
}

variable "vm_worker_start_ip" {
  description = "Starting IP for Talos master nodes"
  type        = string
}