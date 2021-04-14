
module "mig_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  version    = "6.0.0"
  network    = google_compute_network.default.self_link
  subnetwork = google_compute_subnetwork.default.self_link
  machine_type = var.VMsize
  disk_size_gb = var.disk_size_gb
  service_account = {
    email  = ""
    scopes = ["cloud-platform"]
  }
  name_prefix    = var.network_name
  startup_script = <<-EOF
    sudo curl -sSL https://get.docker.com/ | sh
    sudo usermod -aG docker `echo $USER`
    sudo systemctl start docker
    sudo docker run -d -p 80:80 nginx
    EOF

  tags = [
    var.fw_allow_networktag
  ]
}

module "mig" {
  source            = "terraform-google-modules/vm/google//modules/mig"
  version           = "6.2.0"
  instance_template = module.mig_template.self_link
  region            = var.region
  hostname          = var.mig_name
    target_size       = var.mig_size
    named_ports = [{
    name = "http",
    port = var.fw_allow_port
  }]
  network    = google_compute_network.default.self_link
  subnetwork = google_compute_subnetwork.default.self_link
}
