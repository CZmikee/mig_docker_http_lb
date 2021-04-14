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

resource "google_compute_health_check" "http-basic-check" {
  name = var.http_check_name
  project = var.project

  timeout_sec         = 2
  check_interval_sec  = 3
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    port = "80"
  }
}

resource "google_compute_backend_service" "http-map-backend-service" {
  name          = var.backend_service
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [google_compute_health_check.http-basic-check.self_link]


    backend {
    group = module.mig.instance_group
  }
}

resource "google_compute_url_map" "web-map" {
  name        = var.web_mapping
    default_service = google_compute_backend_service.http-map-backend-service.self_link
}

resource "google_compute_target_http_proxy" "http-lb-proxy" {
  name        = var.http_lb_proxy
    url_map     = google_compute_url_map.web-map.self_link
}

resource "google_compute_global_forwarding_rule" "http-rule" {
  name       = var.http_rule_name
    target     = google_compute_target_http_proxy.http-lb-proxy.self_link
  port_range = var.fw_allow_port
}

