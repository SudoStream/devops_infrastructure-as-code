

resource "google_container_cluster" "primary" {
  name = "api-event-horizon-cluster"
  zone = "europe-west1-b"
  initial_node_count = 1

  master_auth {
    username = "andy.sudo"
    password = "heyho"
  }

  node_config {
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/projecthosting",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}



