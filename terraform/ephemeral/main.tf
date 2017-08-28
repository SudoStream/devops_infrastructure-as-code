provider "google" {
  credentials = "${file("/home/andy/.ssh/gcloud/brownian-motion-driven-dev-2e36c39299f6.json")}"
  project     = "brownian-motion-driven-dev"
  region      = "europe-west1"
}

