resource "digitalocean_droplet" "vm" {

  name   = var.droplet_name
  region = var.region
  size   = var.droplet_size
  image  = var.image

  monitoring = true

  ipv6 = true

  backups = false

  vpc_uuid = digitalocean_vpc.vpc.id

  ssh_keys = [
    data.digitalocean_ssh_key.default.id
  ]

  user_data = file("${path.module}/cloud-init.yaml")

  tags = [
    "docker",
    "terraform",
    "microservices",
    "poc"
  ]
}

resource "digitalocean_project_resources" "resources" {

  project = digitalocean_project.project.id

  resources = [
    digitalocean_droplet.vm.urn
  ]
}
