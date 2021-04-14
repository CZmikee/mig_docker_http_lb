variable "project" {
  description = "Project where all parts should be created"
}

variable "creds" {
  description = "Service file used for logging"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "c"
}

variable "network_name" {
  default = "tf-lb-http-mig-nat"
}

variable "mig_name" {
  default = "managed-instance-group"
}

variable "mig_size" {
  default = "2"
}

variable "source_image_family" {
  default     = "centos-7"
}

variable "source_image_project" {
  default     = "centos-cloud"
}

variable "VMsize" {
  default = "n1-standard-2"
}

variable "disk_size_gb" {
  default = "20"
}

variable "http_check_name" {
  default = "http-basic-check"
}

variable "web_mapping" {
  default = "web-map"
}
variable "http_lb_proxy" {
  default = "http-lb-proxy"
}

variable "http_rule_name" {
  default = "http-cr-rule"
}

variable "forward_port" {
  default = "80"
}

variable "fw_allow_networktag" {
  default = "http"
}

variable "fw_allow_protocol" {
  default = "tcp"
}

variable "fw_allow_port" {
  default = "80"
}


variable "fw_http_allow_name" {
  default = "allow-lb-and-healthcheck"
}

variable "ssh_iap_name" {
  default = "allow-ssh-from-iap"
}

variable "nat_router_name" {
  default = "nat-router-europe-west-1"
}

variable "nat_conf_name" {
  default = "nat-config"
}
variable "backend_service" {
  default = "http-map-backend-service"
}
variable "ip_cidr_range" {
  default = "10.132.0.0/20"
}