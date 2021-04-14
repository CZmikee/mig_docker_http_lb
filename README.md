# mig_docker_http_lb

Terraform module that prepares separate env per variable environs (inside variables.tf) with http loadbalanced
 ports over dockerd inside of the managed instance group vms. Size of the environs can be set in the var, size of the VM
 also can be changed via variable (VMsize) and many others (can be looked up in ./modules/mig_docker_http_lb/variables.tf )
 VMs are without ephemeral public IP but with cloud NAT access outside and IAP ssh access set and enabled on FW.
 Prod and Dev have separate CIDR ranges, additionals can be added if needed in the same fashion (in both vars environs and cidr_mapping)

# Mandatory variables to be set: "project" (meant as project ID) and "creds" (meant as path to the service account json file used for the rest)
