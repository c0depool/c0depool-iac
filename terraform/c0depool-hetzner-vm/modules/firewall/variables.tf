variable "firewall_name" {
    description = "Name of firewall"
    type = string
  
}

variable "inbound_rules" {
  description = "List of inbound firewall rules"
  type = list(object({
    protocol   = string
    port       = string
    source_ips = list(string)
  }))
}
