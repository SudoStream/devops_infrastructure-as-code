provider "google" {
  credentials = "${file("/home/andy/.secrets/time-to-teach-d7674dc7f9b7.json")}"
  project     = "time-to-teach-zone"
  region      = "europe-west1"
}

