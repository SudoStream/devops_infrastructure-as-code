

resource "google_container_cluster" "primary" {
  name = "timetoteach-dev-cluster"
  zone = "europe-west1-c"
  initial_node_count = 3

  master_auth {
    username = "andy.sudo"
    password = "heyho"
  }

  node_config {
    machine_type = "n1-standard-2"

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



