locals {
  vm_master_nodes = {
    for node_key, node_config in var.vm_master_nodes :
    node_key => merge(node_config, {
      clone_target = var.clone_target
      node_ipconfig = format(
        # Split the starting IP into individual octets so we can:
        # 1. Increment the last octet for each node
        # 2. Use the first three octets to generate the gateway address
        "ip=%s.%s.%s.%d/24,gw=%s.%s.%s.1",
        element(split(".", var.vm_master_start_ip), 0),
        element(split(".", var.vm_master_start_ip), 1),
        element(split(".", var.vm_master_start_ip), 2),
        tonumber(element(split(".", var.vm_master_start_ip), 3)) + tonumber(node_key),
        element(split(".", var.vm_master_start_ip), 0),
        element(split(".", var.vm_master_start_ip), 1),
        element(split(".", var.vm_master_start_ip), 2),
      )
    })
  }
  vm_worker_nodes = {
    for node_key, node_config in var.vm_worker_nodes :
    node_key => merge(node_config, {
      clone_target = var.clone_target
      node_ipconfig = format(
        "ip=%s.%s.%s.%d/24,gw=%s.%s.%s.1",
        element(split(".", var.vm_worker_start_ip), 0),
        element(split(".", var.vm_worker_start_ip), 1),
        element(split(".", var.vm_worker_start_ip), 2),
        tonumber(element(split(".", var.vm_worker_start_ip), 3)) + tonumber(node_key),
        element(split(".", var.vm_worker_start_ip), 0),
        element(split(".", var.vm_worker_start_ip), 1),
        element(split(".", var.vm_worker_start_ip), 2),
      )
    })
  }
}
