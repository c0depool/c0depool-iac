resource "google_compute_network" "vpc_network" {
  name                    = "${var.network_name_prefix}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.network_name_prefix}-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
}

resource "google_compute_firewall" "egress_firewall_rules" {
  for_each = { for key, rule in var.vpc_firewall_rules : key => rule if rule.type == "egress" }

  name      = "${var.network_name_prefix}-allow-egress-${each.value.protocol}-${each.value.name}"
  network   = google_compute_network.vpc_network.id
  direction = "EGRESS"

  allow {
    protocol = each.value.protocol
    ports    = try(each.value.port, null) != null ? ["${each.value.port}"] : []
  }

  source_ranges      = each.value.source_cidr
  destination_ranges = each.value.destination_cidr
}

resource "google_compute_firewall" "ingress_firewall_rules" {
  for_each = { for key, rule in var.vpc_firewall_rules : key => rule if rule.type == "ingress" }

  name      = "${var.network_name_prefix}-allow-ingress-${each.value.protocol}-${each.value.name}"
  network   = google_compute_network.vpc_network.id
  direction = "INGRESS"

  allow {
    protocol = each.value.protocol
    ports    = try(each.value.port, null) != null ? ["${each.value.port}"] : []
  }

  source_ranges      = each.value.source_cidr
  destination_ranges = each.value.destination_cidr
}