provider "google" {
  credentials = file(var.creds)
  project = var.project
  zone = "${var.region}-${var.zone}"
}


provider "google-beta" {
  credentials = file(var.creds)
  project = var.project
  zone = "${var.region}-${var.zone}"
}
