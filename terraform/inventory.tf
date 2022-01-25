resource "local_file" "private_key" {
  sensitive_content = tls_private_key.key.private_key_pem
  filename = format("%s/%s/%s", abspath(path.root), ".ssh", "gh-actions-ssh.pem")
  file_permission = "0600"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftpl", {
   ip_addrs = digitalocean_droplet.gh_actions_runner[*].ipv4_address
   ssh_keyfile = local_file.private_key.filename
  })
  filename = format("%s/%s", abspath(path.root), "inventory.yml")
}
