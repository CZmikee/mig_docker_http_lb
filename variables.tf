
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

variable "project" {
  default = "sandbox-310617"
}

variable "creds" {
  default = "sandbox-310617-f4044de768d7.json"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "c"
}
