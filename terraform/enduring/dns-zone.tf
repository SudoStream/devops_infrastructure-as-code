resource "google_dns_managed_zone" "dev" {
  name     = "timetoteach-dev"
  dns_name = "timetoteach-dev.timetoteach.zone."
  description = "TimeToTeach Dev"
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
