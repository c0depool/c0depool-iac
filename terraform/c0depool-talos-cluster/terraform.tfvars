clone_target = "talos-v1.10.4-cloud-init-template"

# Master Node configuration
vm_master_start_ip = "192.168.0.170"
vm_master_nodes = {
  "0" = {
    vm_id          = 200
    node_name      = "talos-master-00"
    node_cpu_cores = 2
    node_memory    = 2560
    node_disk      = 32
  }
  "1" = {
    vm_id          = 201
    node_name      = "talos-master-01"
    node_cpu_cores = 2
    node_memory    = 2560
    node_disk      = 32
  }
  "2" = {
    vm_id          = 202
    node_name      = "talos-master-02"
    node_cpu_cores = 2
    node_memory    = 2560
    node_disk      = 32
  }
}

# Worker Node configuration
vm_worker_start_ip = "192.168.0.180"
vm_worker_nodes = {
  "0" = {
    vm_id                = 300
    node_name            = "talos-worker-00"
    node_cpu_cores       = "4"
    node_memory          = 7168
    node_disk            = "32"
    additional_node_disk = "128" # for longhorn
  }
  "1" = {
    vm_id                = 301
    node_name            = "talos-worker-01"
    node_cpu_cores       = "4"
    node_memory          = 7168
    node_disk            = "32"
    additional_node_disk = "128" # for longhorn
  }
  "2" = {
    vm_id                = 302
    node_name            = "talos-worker-02"
    node_cpu_cores       = "4"
    node_memory          = 7168
    node_disk            = "32"
    additional_node_disk = "128" # for longhorn
  }
}