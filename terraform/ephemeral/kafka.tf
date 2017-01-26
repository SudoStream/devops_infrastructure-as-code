resource "google_compute_address" "kafka-server-address" {
  name = "kafka-server-address"
}

resource "google_compute_instance" "kafka-server" {
  name         = "kafka.dev.sudostream.io"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  tags = ["kafka", "messaging"]

  disk {
    image = "aeh-kafka-1485457656"
  }

  disk {
    type    = "local-ssd"
    scratch = true
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.kafka-server-address.address}"
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

variable "dev_dns_name" {}
variable "dev_dns_zone_name" {}

resource "google_dns_record_set" "kafka" {
  name = "kafka.${var.dev_dns_name}"
  type = "A"
  ttl  = 300
  managed_zone = "${var.dev_dns_zone_name}"
  rrdatas = ["${google_compute_instance.kafka-server.network_interface.0.access_config.0.assigned_nat_ip}"]
}

output "kafka_external_ips" {
  value = "${join(" ", google_compute_instance.kafka-server.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "kafka_internal_ips" {
  value = "${join(" ", google_compute_instance.kafka-server.*.network_interface.0.address)}"
}
