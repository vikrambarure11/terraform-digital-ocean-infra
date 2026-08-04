output "public_ip" {

  value = digitalocean_droplet.vm.ipv4_address
}

output "private_ip" {

  value = digitalocean_droplet.vm.ipv4_address_private
}

output "droplet_id" {

  value = digitalocean_droplet.vm.id
}

output "ssh_command" {

  value = "ssh root@${digitalocean_droplet.vm.ipv4_address}"
}
