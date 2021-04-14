/*
Copyright 2019 Google LLC
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    https://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#<!--* freshness: { owner: 'ttaggart@google.com' reviewed: '2019-10-01' } *-->

resource "google_compute_firewall" "http" {
  name          = var.fw_http_allow_name
  network       = var.network_name
  project       = var.project
  target_tags   = [var.fw_allow_networktag]

  source_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16", 
  ]

  allow {
    protocol    = var.fw_allow_protocol
    ports       = [var.fw_allow_port,]
  }
}

resource "google_compute_firewall" "allow-ssh-from-iap" {
  name          = var.ssh_iap_name
  network       = var.network_name
  project       = var.project

  source_ranges = [
    "35.235.240.0/20", 
  ]

  allow {
    protocol    = "tcp"
    ports       = ["22",]
  }
}
