nodes = {
  "0" = {
    node_name      = "bastion"
    clone_target   = "debian-12-cloudimage"
    node_cpu_cores = "2"
    node_memory    = 2048
    node_ipconfig  = "ip=192.168.0.206/24,gw=192.168.0.1"
    node_disk      = "32G"
  }
}