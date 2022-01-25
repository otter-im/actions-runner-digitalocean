resource "tls_private_key" "key" {
  algorithm = "ECDSA"
  ecdsa_curve = "P521"
}

resource "digitalocean_ssh_key" "default" {
  name = "terraform-gh-actions-key"
  public_key = tls_private_key.key.public_key_openssh
}
