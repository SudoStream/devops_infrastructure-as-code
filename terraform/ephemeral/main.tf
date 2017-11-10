provider "google" {
  credentials = "${file("/home/andy/.secrets/time-to-teach-zone-a414655775c4.json")}"
  project     = "time-to-teach-zone"
  region      = "europe-west1"
}

