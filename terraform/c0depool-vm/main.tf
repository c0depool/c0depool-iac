# Dynamically create VMs.
module "compute" {
  source                   = "./compute"
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_node             = var.proxmox_node
  nodes                    = var.nodes
}