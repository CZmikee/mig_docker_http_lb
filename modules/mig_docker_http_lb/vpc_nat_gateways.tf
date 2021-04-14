resource "google_compute_router" "nat-router" {
  name = var.nat_router_name
  region = var.region
  network = var.network_name
}


resource "google_compute_router_nat" "nat-config" {
  name                               = var.nat_conf_name
  router                             = google_compute_router.nat-router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
