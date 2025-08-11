# c0depool-iac
Infrastructure provisioning code for c0depool home cluster.

## Components

- [Packer](/packer/): Machine images using developer.hashicorp.com/packer.
  - `talos-packer`: [Proxmox](https://www.proxmox.com/en/) template for Talos linux based on nocloud image.
- [Terraform](/terraform/): IaC for cloud and Proxmox VMs as well as LXCs using [Terraform](https://developer.hashicorp.com/terraform).
  - `adguard-home`: Proxmox LXC for [Adguard Home](https://github.com/AdguardTeam/AdGuardHome).
  - `c0depool-hetzner-vm`: [Hetzner](https://www.hetzner.com/) cloud VM.
  - `c0depool-talos-cluster`: Proxmox VMs for Talos Kubernetes cluster.
  - `c0depool-vm`: Generic Proxmox VM.
  - `gcp-vm`: [GCP](https://cloud.google.com/) cloud VM with [Wireguard](https://www.wireguard.com/).
  - `k3s-cluster-proxmox`: Proxmox VMs for [K3s](https://k3s.io/) Kubernetes cluster.
  - `wireguard`: Proxmox LXC for [Wireguard](https://www.wireguard.com/).
- [Talos](/talos/): [Talhelper](https://budimanjojo.github.io/talhelper/latest/) configuration for Talos.