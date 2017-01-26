provider "google" {
  credentials = "${file("/home/andy/.ssh/gcloud/api-event-horizon-dc3bca8713a5.json")}"
  project     = "api-event-horizon-151020"
  region      = "europe-west1"
}

