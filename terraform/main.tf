resource "digitalocean_droplet" "gh_actions_runner" {
  image  = "ubuntu-20-04-x64"
  name   = "${var.instance_name}-${count.index}"
  ipv6   = true
  region = var.instance_region
  size   = var.instance_size
  ssh_keys = [ digitalocean_ssh_key.default.fingerprint ]
  monitoring = false
  count  = var.instance_count
}

resource "digitalocean_project" "development" {
  name        = "Otter Social (development)"
  description = "Otter Social"
  purpose     = "Service or API"
  environment = "Development"
  resources   = digitalocean_droplet.gh_actions_runner[*].urn
}
