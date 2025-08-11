output "subnet_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet.id
}
# output "security_group_id" {
#   description = "Security Group ID"
#   value       = aws_security_group.main.id
# }