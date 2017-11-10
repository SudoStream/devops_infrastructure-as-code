provider "google" {
  credentials = "${file("/home/andy/.secrets/time-to-teach-4fea6557e082.json")}"
  project     = "time-to-teach-zone"
  region      = "europe-west1"
}

