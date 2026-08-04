data "digitalocean_ssh_key" "default" {
  name = var.ssh_key_name
}

resource "digitalocean_project" "project" {

  name        = var.project_name
  description = "POC Infrastructure"
  purpose     = "Web Application"
  environment = "Development"
}

resource "digitalocean_vpc" "vpc" {

  name     = var.vpc_name
  region   = var.region
  ip_range = "10.20.0.0/24"
}
