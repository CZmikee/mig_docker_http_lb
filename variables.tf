
variable "environs" {
  default = {
    dev = 2
    prod = 3
  }
}

variable "cidr_mapping" {
  default = {
    "dev" = "10.132.0.0/24"
    "prod" = "10.133.0.0/24"
  }
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "c"
}



variable "project" {
  description = "Project where all parts should be created"
}

variable "creds" {
  description = "Path to a JSON Service file used for all operations"
}
