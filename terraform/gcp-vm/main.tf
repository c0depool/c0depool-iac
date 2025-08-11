module "network" {
  source              = "./network"
  region              = var.region
  network_name_prefix = var.network_name_prefix
  subnet_cidr         = var.subnet_cidr
  vpc_firewall_rules  = var.vpc_firewall_rules
}
module "compute" {
  source    = "./compute"
  region    = var.region
  nodes     = var.nodes
  subnet_id = module.network.subnet_id
}