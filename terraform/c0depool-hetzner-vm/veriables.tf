variable "hcloud_token" {
  description = "Hetzner API token"
  type        = string
}

# Variables for Server

variable "server_name" {
  description = "Name of server resource"
  type        = string
}

variable "server_type" {
  description = "Type of server"
  type        = string
  default     = "cx22"
}

variable "server_image" {
  description = "Type of server image"
  type        = string
  default     = "ubuntu-24.04"
}

variable "server_location" {
  description = "Location of server"
  type        = string
  default     = "nbg1"
}

variable "ssh_keys" {
  description = "Map of SSH key names and public key contents"
  type = map(object({
    name       = string
    public_key = string
  }))
}

# Variables for Firewall

variable "firewall_name" {
  description = "Name of firewall"
  type        = string

}

variable "inbound_rules" {
  description = "List of inbound firewall rules"
  type = list(object({
    protocol   = string
    port       = string
    source_ips = list(string)
  }))
}