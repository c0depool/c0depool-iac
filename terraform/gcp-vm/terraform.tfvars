## Common Configuration ##
region = "us-central1"
## Network Configuration ##
network_name_prefix = "c0depool"
subnet_cidr         = "10.50.50.0/24"
vpc_firewall_rules = [
  {
    name             = "ssh"
    type             = "ingress"
    port             = 22
    protocol         = "tcp"
    source_cidr      = ["0.0.0.0/0"]
    destination_cidr = ["0.0.0.0/0"]
  },
  {
    name             = "wireguard"
    type             = "ingress"
    port             = 60000
    protocol         = "udp"
    source_cidr      = ["0.0.0.0/0"]
    destination_cidr = ["0.0.0.0/0"]
  },
  {
    name             = "wireguard-home"
    type             = "ingress"
    port             = 61000
    protocol         = "udp"
    source_cidr      = ["0.0.0.0/0"]
    destination_cidr = ["0.0.0.0/0"]
  },
  {
    name             = "wireguard-india"
    type             = "ingress"
    port             = 62000
    protocol         = "udp"
    source_cidr      = ["0.0.0.0/0"]
    destination_cidr = ["0.0.0.0/0"]
  }
]
