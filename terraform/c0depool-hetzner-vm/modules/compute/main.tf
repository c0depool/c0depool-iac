resource "hcloud_ssh_key" "keys" {
  for_each = var.ssh_keys

  name       = each.value.name
  public_key = each.value.public_key
}

resource "hcloud_server" "server" {
  name         = var.server_name
  server_type  = var.server_type
  image        = var.server_image
  location     = var.server_location
  firewall_ids = var.firewall_ids
  ssh_keys     = [for key in values(hcloud_ssh_key.keys) : key.id]
  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
  }
  user_data = local.cloud_init
}