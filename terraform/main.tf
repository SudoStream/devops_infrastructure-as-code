provider "google" {
  credentials = "${file("/home/andy/.ssh/gcloud/api-event-horizon-dev-3a99f168ab14.json")}"
  project     = "api-event-horizon-dev"
  region      = "europe-west1"
}

resource "google_compute_instance" "default" {
  name         = "kafka-1"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  tags = ["kafka", "messaging"]

  disk {
    //image = "ubuntu-os-cloud/ubuntu-1604-lts"
    image = "aeh-kafka-1484577698"
  }

  // Local SSD disk
  disk {
    type    = "local-ssd"
    scratch = true
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  //metadata_startup_script = "${file("${path.module}/kafkaStartup.sh")}"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

output "external_instance_ips" {
  value = "${join(" ", google_compute_instance.default.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "internal_instance_ips" {
  value = "${join(" ", google_compute_instance.default.*.network_interface.0.address)}"
}

