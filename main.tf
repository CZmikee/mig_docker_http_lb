# Terraform module that prepares separate env per variable environs (inside variables.tf) with http loadbalanced
#  ports over dockerd inside of the managed instance group vms. Size of the environs can be set in the var, size of the VM
#  also can be changed via variable (VMsize) and many others (can be looked up in ./modules/mig_docker_http_lb/variables.tf )
# VMs are without ephemeral public IP but with cloud NAT access outside and IAP ssh access set and enabled on FW.
# Prod and Dev have separate CIDR ranges, additionals can be added if needed in the same fashion (in both vars environs and cidr_mapping)

#Mandatory variables to be set: "project" (meant as project ID)  and "creds" (meant as path to the service account json file used for the rest)


module "mig_docker_http_lb" {
  source     = "./modules/mig_docker_http_lb"
  for_each = var.environs
  mig_name = "mig-${each.key}"
  mig_size = each.value
  http_rule_name = "http-cr-rule-${each.key}"
  http_lb_proxy = "http-lb-proxy-${each.key}"
  http_check_name = "http-check-${each.key}"
  ssh_iap_name = "allow-ssh-from-iap-${each.key}"
  network_name = "internal-ntwrk-${each.key}"
  fw_allow_networktag = "http-${each.key}"
  fw_http_allow_name = "allow-lb-and-healthcheck-${each.key}"
  nat_router_name = "nat-router-${each.key}"
  nat_conf_name = "nat-config-${each.key}"
  backend_service = "http-map-backend-service-${each.key}"
  web_mapping = "web-map-${each.key}"
  ip_cidr_range = lookup(var.cidr_mapping, each.key)
}


