locals {
  vm_nodes = {
    node_01 = {

      node_name      = "c0depool-k8s-master-00"
      clone_target   = "c0depool-debian-cloudimage"
      node_cpu_cores = "2"
      node_memory    = 2048
      node_ipconfig  = "ip=192.168.0.211/32,gw=192.168.0.1"
      node_disk      = "32G"
    }
    node_02 = {

      node_name      = "c0depool-k8s-master-01"
      clone_target   = "c0depool-debian-cloudimage"
      node_cpu_cores = "2"
      node_memory    = 2048
      node_ipconfig  = "ip=192.168.0.212/32,gw=192.168.0.1"
      node_disk      = "32G"
    }
    node_03 = {

      node_name      = "c0depool-k8s-master-02"
      clone_target   = "c0depool-debian-cloudimage"
      node_cpu_cores = "2"
      node_memory    = 2048
      node_ipconfig  = "ip=192.168.0.213/32,gw=192.168.0.1"
      node_disk      = "32G"
    }
    node_04 = {

      node_name      = "c0depool-k8s-worker-00"
      clone_target   = "c0depool-debian-cloudimage"
      node_cpu_cores = "4"
      node_memory    = 4096
      node_ipconfig  = "ip=192.168.0.214/32,gw=192.168.0.1"
      node_disk      = "64G"
    }
    node_05 = {

      node_name      = "c0depool-k8s-worker-01"
      clone_target   = "c0depool-debian-cloudimage"
      node_cpu_cores = "4"
      node_memory    = 4096
      node_ipconfig  = "ip=192.168.0.215/32,gw=192.168.0.1"
      node_disk      = "64G"
    }
  }
}