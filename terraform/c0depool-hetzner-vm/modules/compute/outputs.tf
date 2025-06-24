output "server_ipv6" {
  description = "Server ipv6 address"
  value = hcloud_server.server.ipv6_address
  
}