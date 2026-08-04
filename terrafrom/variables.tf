variable "do_token" {
  type      = string
  sensitive = true
}

variable "region" {
  default = "blr1"
}

variable "project_name" {
  default = "microservices-poc"
}

variable "droplet_name" {
  default = "microservices-vm"
}

variable "droplet_size" {
  default = "s-8vcpu-16gb"
}

variable "image" {
  default = "ubuntu-24-04-x64"
}

variable "vpc_name" {
  default = "microservices-vpc"
}

variable "ssh_key_name" {
  description = "Existing SSH Key Name in DigitalOcean"
}
