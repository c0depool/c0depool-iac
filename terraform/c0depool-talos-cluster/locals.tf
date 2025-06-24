locals {
  # Master Node configuration
  vm_master_nodes = {
    "0" = {
      vm_id          = 200
      node_name      = "talos-master-00"
      clone_target   = var.clone_target
      node_cpu_cores = "2"
      node_memory    = 2560
      node_ipconfig  = "ip=192.168.0.170/24,gw=192.168.0.1"
      node_disk      = "32" # in GB
    }
    "1" = {
      vm_id          = 201
      node_name      = "talos-master-01"
      clone_target   = var.clone_target
      node_cpu_cores = "2"
      node_memory    = 2560
      node_ipconfig  = "ip=192.168.0.171/24,gw=192.168.0.1"
      node_disk      = "32" # in GB
    }
    "2" = {
      vm_id          = 202
      node_name      = "talos-master-02"
      clone_target   = var.clone_target
      node_cpu_cores = "2"
      node_memory    = 2560
      node_ipconfig  = "ip=192.168.0.172/24,gw=192.168.0.1"
      node_disk      = "32" # in GB
    }
  }
  # Worker Node configuration
  vm_worker_nodes = {
    "0" = {
      vm_id                = 300
      node_name            = "talos-worker-00"
      clone_target         = var.clone_target
      node_cpu_cores       = "4"
      node_memory          = 7168
      node_ipconfig        = "ip=192.168.0.180/24,gw=192.168.0.1"
      node_disk            = "32"
      additional_node_disk = "128" # for longhorn
    }
    "1" = {
      vm_id                = 301
      node_name            = "talos-worker-01"
      clone_target         = var.clone_target
      node_cpu_cores       = "4"
      node_memory          = 7168
      node_ipconfig        = "ip=192.168.0.181/24,gw=192.168.0.1"
      node_disk            = "32"
      additional_node_disk = "128" # for longhorn
    }
    "2" = {
      vm_id                = 302
      node_name            = "talos-worker-02"
      clone_target         = var.clone_target
      node_cpu_cores       = "4"
      node_memory          = 7168
      node_ipconfig        = "ip=192.168.0.182/24,gw=192.168.0.1"
      node_disk            = "32"
      additional_node_disk = "128" # for longhorn
    }
  }
}
