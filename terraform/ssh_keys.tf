resource "digitalocean_ssh_key" "default" {
  name = "terraform-gh-actions-key"
  public_key = file(var.ssh_public_key)
}
