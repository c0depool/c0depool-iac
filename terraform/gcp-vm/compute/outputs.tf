output "vm_id" {
  value = [for value in google_compute_instance.vm : value.id]
}
output "public_ip" {
  value = [for value in google_compute_instance.vm : value.network_interface[0].access_config[0].nat_ip]
}
output "private_ip" {
  value = [for value in google_compute_instance.vm : value.network_interface[0].network_ip]
}