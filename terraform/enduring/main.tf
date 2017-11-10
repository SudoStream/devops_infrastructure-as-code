provider "google" {
  credentials = "${file("/home/andy/.secrets/time-to-teach-zone-a414655775c4.json")}"
  project     = "time-to-teach"
  region      = "europe-west1"
}

