variable "region" {
  description = "GCP region for resources"
  type        = string
}
variable "nodes" {
  description = "List of VMs"
  type        = any
}
variable "subnet_id" {
  description = "Subnet ID for the node"
  type        = string
}