provider "google" {
  credentials = "${file("/home/andy/.ssh/gcloud/api-event-horizon-dc3bca8713a5.json")}"
  project     = "api-event-horizon-151020"
  region      = "europe-west1"
}

resource "google_compute_address" "kafka-server-address" {
  name = "kafka-server-address"
}

resource "google_compute_instance" "kafka-server" {
  name         = "kafka-server-1"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  tags = ["kafka", "messaging"]

  disk {
    image = "aeh-kafka-1484686751"
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

resource "google_dns_managed_zone" "dev" {
  name     = "dev-zone"
  dns_name = "sudostream.io."
  description = "Sudostream Dev"
}

resource "google_dns_record_set" "kafka" {
  name = "kafka.${google_dns_managed_zone.dev.dns_name}"
  type = "A"
  ttl  = 300
  managed_zone = "${google_dns_managed_zone.dev.name}"
  rrdatas = ["${google_compute_instance.kafka-server.network_interface.0.access_config.0.assigned_nat_ip}"]
}

output "external_instance_ips" {
  value = "${join(" ", google_compute_instance.kafka-server.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "internal_instance_ips" {
  value = "${join(" ", google_compute_instance.kafka-server.*.network_interface.0.address)}"
}

