locals {
  ssh_public_keys = [for key in values(var.ssh_keys) : key.public_key]
  cloud_init = templatefile("${path.module}/user_data/cloud_init.yaml.tmpl", {
    ssh_keys = local.ssh_public_keys
  })
}