variable "server_name" {
    description = "Name of server resource"
    type = string
}

variable "server_type" {
    description = "Type of server"
    type = string
    default = "cx22"
}

variable "server_image" {
    description = "Type of server image"
    type = string
    default = "ubuntu-24.04"
}

variable "server_location" {
    description = "Location of server"
    type = string
    default = "nbg1"
}


variable "firewall_ids" {
    description = "List of firewall ids"
    type = list(string)
}

variable "ssh_keys" {
  description = "List of SSH key names and public key contents"
  type = map(object({
    name      = string
    public_key = string
  }))
}