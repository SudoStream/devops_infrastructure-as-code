resource "google_dns_managed_zone" "dev" {
  name     = "aeh-dev"
  dns_name = "dev.sudostream.io."
  description = "Sudostream Dev"
}

output "dev_name_servers" {
  value = "${google_dns_managed_zone.dev.name_servers}"
}

output "dev_dns_name" {
  value = "${google_dns_managed_zone.dev.dns_name}"
}


output "dev_dns_zone_name" {
  value = "${google_dns_managed_zone.dev.name}"
}
