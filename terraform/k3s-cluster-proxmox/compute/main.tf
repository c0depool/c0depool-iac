# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "c0depool-k8s" {
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
    cores = each.value.node_cpu_cores
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = each.value.node_memory

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    disk {
        size = each.value.node_disk
        format    = "raw"
        iothread  = 1
        backup    = 0
        storage   = "local-lvm"
        type      = "scsi"
    }
    
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