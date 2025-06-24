# Server variables
server_name = "c0depool-tunnel"

# Firewall variables
firewall_name = "c0depool_firewall"
inbound_rules = [
  {
    protocol   = "tcp"
    port       = "22"
    source_ips = ["0.0.0.0/0", "::/0"]
  },
  #   {
  #     protocol   = "tcp"
  #     port       = "443"
  #     source_ips = ["0.0.0.0/0", "::/0"]
  #   }
]
