resource "google_compute_instance" "vm" {
  count = length(var.nodes)
  boot_disk {
    auto_delete             = true
    device_name             = "${var.nodes[count.index].name}-disk"
    disk_encryption_key_raw = var.nodes[count.index].disk_encryption_key

    initialize_params {
      image = var.nodes[count.index].image
      size  = var.nodes[count.index].disk_size
      type  = "pd-standard"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  machine_type = "e2-micro"
  name         = var.nodes[count.index].name

  network_interface {
    access_config {
      network_tier = "STANDARD"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = var.subnet_id

  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "${var.region}-a"

  metadata = {
    ssh-keys = var.nodes[count.index].ssk_keys
  }
}
