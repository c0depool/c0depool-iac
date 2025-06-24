
module "firewall" {
  source        = "./modules/firewall"
  firewall_name = var.firewall_name
  inbound_rules = var.inbound_rules

}

module "compute" {
  source          = "./modules/compute"
  server_name     = var.server_name
  server_image    = var.server_image
  server_type     = var.server_type
  server_location = var.server_location
  firewall_ids    = [module.firewall.firewall_id]
  ssh_keys        = var.ssh_keys

}

