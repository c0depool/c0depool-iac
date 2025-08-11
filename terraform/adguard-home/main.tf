resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "proxmox_lxc" "adguard_home" {

  target_node  = var.proxmox_node
  hostname     = var.ct_name
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = random_password.password.result
  start        = true
  unprivileged = true
  onboot       = true

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  memory = var.ct_memory
  cores  = var.ct_cpu_cores


  nameserver = "1.1.1.1"
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = var.ct_ipconfig
    gw     = var.ct_gw
  }

  ssh_public_keys = var.ssh_pub_key

  provisioner "file" {
    source      = var.adguard_home_config_path
    destination = "/tmp/AdGuardHome.yaml"
    on_failure  = fail
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_pri_key_path)
      timeout     = "2m"
      host        = split("/", self.network[0].ip)[0]
    }
  }

  provisioner "file" {
    source      = var.adguard_home_certs_path
    destination = "/opt"
    on_failure  = fail
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_pri_key_path)
      timeout     = "2m"
      host        = split("/", self.network[0].ip)[0]
    }
  }

  provisioner "remote-exec" {
    script     = "scripts/remote.sh"
    on_failure = fail
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_pri_key_path)
      timeout     = "2m"
      host        = split("/", self.network[0].ip)[0]
    }
  }
}

output "container_id" {
  value = proxmox_lxc.adguard_home.id
}
