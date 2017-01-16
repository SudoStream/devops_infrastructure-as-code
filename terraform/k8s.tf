

resource "google_container_cluster" "primary" {
  name = "api-event-horizon-cluster"
  zone = "europe-west1-b"
  initial_node_count = 3

  master_auth {
    username = "andy.sudo"
    password = "heyho"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}



