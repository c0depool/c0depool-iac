variable "region" {
  description = "GCP region for resources"
  type        = string
}
variable "network_name_prefix" {
  description = "Name prefix for the VPC network components"
  type        = string
}
variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}
variable "vpc_firewall_rules" {
  description = "List of security group rules"
  type = list(object({
    name             = string
    type             = string
    port             = optional(number)
    protocol         = string
    source_cidr      = list(string)
    destination_cidr = list(string)
  }))
}