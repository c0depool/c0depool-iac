# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "c0depool-vm" {
  for_each = var.nodes

  # VM General Settings
  target_node = var.proxmox_node
  #vmid = "100"
  name = each.value.node_name
  #desc = "Description"

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings
  clone = each.value.clone_target

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores    = each.value.node_cpu_cores
  sockets  = 1
  cpu_type = "host"

  # VM Memory Settings
  memory = each.value.node_memory

  # VM Network Settings
  network {
    id       = 0
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = true
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size = each.value.node_disk
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  # disk {
  #     size = each.value.node_disk
  #     format    = "raw"
  #     iothread  = true
  #     backup    = false
  #     storage   = "local-lvm"
  #     slot      = "scsi0"
  # }

  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # (Optional) IP Address and Gateway
  ipconfig0 = each.value.node_ipconfig

  # (Optional) Default User
  # ciuser = "your-username"

  # (Optional) Add your SSH KEY
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF
}