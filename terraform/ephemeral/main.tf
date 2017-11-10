provider "google" {
  credentials = "${file("/home/andy/.secrets/time-to-teach-zone-ffc79db65fb1.json")}"
  project     = "time-to-teach-zone"
  region      = "europe-west1"
}

